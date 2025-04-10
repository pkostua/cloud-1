variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
  default     = null
}

variable "static_access_key" {
  type        = bool
  default     = true
  description = "Create service account authorized keys? Generated pair of keys is used to access Yandex Object Storage on behalf of service account."
}

variable "name" {
  type        = string
  default     = null
  description = "Name for service account"
}

variable "description" {
  description = "Optional description of this resource."
  type        = string
  default     = "Service account to create infrastucture in terraform"
}

variable "roles" {
  description = "A list of roles that will be attached to in folder scope"
  type        = list(string)
  validation {
    condition     = alltrue([for i in var.roles : can(regex("^([a-zA-Z0-9.-]*.[a-zA-Z-]*.)$", i))])
    error_message = "Invalid A list of roles for terraform SA."
  }
}


