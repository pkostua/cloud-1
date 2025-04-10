## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_iam_service_account.sa](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account) | resource |
| [yandex_iam_service_account_static_access_key.sa-access-key](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/iam_service_account_static_access_key) | resource |
| [yandex_resourcemanager_folder_iam_member.folder-member](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/resourcemanager_folder_iam_member) | resource |
| [yandex_client_config.client](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Optional description of this resource. | `string` | `"Service account to create infrastucture in terraform"` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name for service account | `string` | `null` | no |
| <a name="input_roles"></a> [roles](#input\_roles) | A list of roles that will be attached to in folder scope | `list(string)` | n/a | yes |
| <a name="input_static_access_key"></a> [static\_access\_key](#input\_static\_access\_key) | Create service account authorized keys? Generated pair of keys is used to access Yandex Object Storage on behalf of service account. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_key"></a> [access\_key](#output\_access\_key) | ID of the static access key or `null` if `static_access_key` was not set to true. |
| <a name="output_id"></a> [id](#output\_id) | ID of the service account |
| <a name="output_secret_key"></a> [secret\_key](#output\_secret\_key) | Private part of generated static access key or `null` if `static_access_key` was not set to true. |
