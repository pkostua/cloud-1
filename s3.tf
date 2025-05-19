// Создать бакет в Object Storage с произвольным именем
//Перед бакетом нужно создать сервисный аккаунт

module "bucket-sa" {
  source = "./sa"
  folder_id = var.folder_id
  name = var.bucket-admin-name
  roles = ["storage.admin", "kms.keys.encrypterDecrypter"]
}

resource "yandex_kms_symmetric_key" "key-kms" {
  name              = var.bucket-name
  description       = "Key for encrypt bucket ${var.bucket-name}"
}

// Только после этого получится создать бакет
resource "yandex_storage_bucket" "image-bucket" {
  access_key = module.bucket-sa.access_key
  secret_key = module.bucket-sa.secret_key
  bucket = var.dns-name

  anonymous_access_flags {
    list = true
    read = true
  }
  force_destroy = true
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-kms.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
  website {
    index_document = "index.html"
  }

  https {
    certificate_id = data.yandex_cm_certificate.example.id
  }

}

//И загрузить картинку
resource "yandex_storage_object" "picture" {
  bucket     = yandex_storage_bucket.image-bucket.bucket
  access_key = module.bucket-sa.access_key
  secret_key = module.bucket-sa.secret_key
  acl        = "public-read"
  key        = var.image-key
  source     = var.image-path
  tags = {
    type = var.image-tag
  }
}

resource "yandex_storage_object" "html" {
  bucket     = yandex_storage_bucket.image-bucket.bucket
  access_key = module.bucket-sa.access_key
  secret_key = module.bucket-sa.secret_key
  acl        = "public-read"
  key        = var.html-key
  source     = var.html-path
  tags = {
    type = var.html-tag
  }
}

resource "yandex_cm_certificate" "le-certificate" {
  name    = "${var.dns-zone-name}-le-cert"
  domains = ["${var.dns-name}"]

  managed {
    challenge_type = "DNS_CNAME"
  }
}

resource "yandex_dns_recordset" "validation-record" {
  zone_id = yandex_dns_zone.zone1.id
  name    = yandex_cm_certificate.le-certificate.challenges[0].dns_name
  type    = yandex_cm_certificate.le-certificate.challenges[0].dns_type
  data    = [yandex_cm_certificate.le-certificate.challenges[0].dns_value]
  ttl     = 600
}

data "yandex_cm_certificate" "example" {
  depends_on      = [yandex_dns_recordset.validation-record]
  certificate_id  = yandex_cm_certificate.le-certificate.id
}

resource "yandex_dns_zone" "zone1" {
  name        = "${var.dns-zone-name}"
  zone        = "${var.dns-name}."
  public      = true
}

resource "yandex_dns_recordset" "rs2" {
  zone_id = yandex_dns_zone.zone1.id
  name    = "${var.dns-name}."
  type    = "ANAME"
  ttl     = 600
  data    = ["${var.bucket-name}.website.yandexcloud.net"]
}