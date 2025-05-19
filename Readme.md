# Домашнее задание к занятию «Безопасность в облачных провайдерах»
https://github.com/netology-code/clopro-homeworks/blob/main/15.3.md

## С помощью ключа в KMS необходимо зашифровать содержимое бакета:
### создать ключ в KMS;  
```
resource "yandex_kms_symmetric_key" "key-kms" {
  name              = var.bucket-name
  description       = "Key for encrypt bucket ${var.bucket-name}"
}
```
### с помощью ключа зашифровать содержимое бакета, созданного ранее.
```
resource "yandex_storage_bucket" "image-bucket" {
  ....
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-kms.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
```
## Создать статический сайт в Object Storage c собственным публичным адресом и сделать доступным по HTTPS
1. Идем к регистратору домена и передаем управление yandex.cloud. В моем случае домен pkdp.ru
2. Добавляем в терраформ ресурсы управления доменом и сертифкатом, связываем сертификат со статическим сайтом
```
...
resource "yandex_storage_bucket" "image-bucket" {
  ...
  website {
    index_document = "index.html"
  }
  https {
    certificate_id = data.yandex_cm_certificate.example.id
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
  data    = ["${var.dns-name}.website.yandexcloud.net"]
}
```  
Весь файл доступен здесь https://github.com/pkostua/cloud-1/blob/master/s3.tf

Статический сайт с сертификатом letsencrypt
![image](https://github.com/user-attachments/assets/3be0d744-fd40-4d92-a5de-ab83c92fe4b9)





