output "id" {
  description = "ID of the service account"
  value       = try(yandex_iam_service_account.sa[0].id, null)
}

output "access_key" {
  description = "ID of the static access key or `null` if `static_access_key` was not set to true."

  value = try(yandex_iam_service_account_static_access_key.sa-access-key[0].access_key, null)
}

output "secret_key" {
  description = "Private part of generated static access key or `null` if `static_access_key` was not set to true."

  value = try(yandex_iam_service_account_static_access_key.sa-access-key[0].secret_key, null)

  sensitive = true
}
