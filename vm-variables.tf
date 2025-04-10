###vm vars

variable "default_platform_id" {
  type = string
  default = "standard-v3"
}

variable "vm_ubuntu" {
  type        = string
  default     = "debian-11"
  description = "https://yandex.cloud/ru/docs/compute/concepts/image"
}


variable "vm_default_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
  description = "https://yandex.cloud/ru/docs/compute/concepts/image"
}

variable "vm_nat_ip" {
  type        = string
  default     = "192.168.10.254"
}

variable "vm_public_ip" {
  type        = string
  default     = "192.168.10.10"
}

variable "vm_private_ip" {
  type        = string
  default     = "192.168.20.20"
}


variable "vm_public_name" {
  type        = string
  default     = "public-instance"
}

variable "vm_private_name" {
  type        = string
  default     = "private-instance"
}



variable "vm_nat_instance_name" {
  type        = string
  default     = "nat-instance"
}


variable "vm_default_cores" {
  type        = number
  default     = 2
}

variable "vm_default_memory" {
  type        = number
  default     = 2
}

variable "app_port" {
  type        = number
  default     = 80
}

