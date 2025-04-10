
resource "yandex_iam_service_account" "sa" {
  count       = 1
  folder_id   = var.folder_id
  name        = var.name
  description = var.description
}

resource "yandex_resourcemanager_folder_iam_member" "folder-member" {
  for_each  = length(var.roles) > 0 ? toset(var.roles) : []
  folder_id = var.folder_id
  role      = each.value
  member    = "serviceAccount:${yandex_iam_service_account.sa[0].id}"
}


resource "yandex_iam_service_account_static_access_key" "sa-access-key" {
  count              = var.static_access_key ? 1 : 0
  service_account_id = yandex_iam_service_account.sa[0].id
  description        = "key for service account ${yandex_iam_service_account.sa[0].name}"
}


