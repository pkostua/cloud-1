// Создать бакет в Object Storage с произвольным именем
//Перед бакетом нужно создать сервисный аккаунт

module "bucket-sa" {
  source = "./sa"
  folder_id = var.folder_id
  name = var.bucket-admin-name
  roles = ["storage.editor"]
}

// Только после этого получится создать бакет
resource "yandex_storage_bucket" "image-bucket" {
  access_key = module.bucket-sa.access_key
  secret_key = module.bucket-sa.secret_key
  bucket = var.bucket-name

  anonymous_access_flags {
    list = true
    read = true
  }
  force_destroy = true

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
