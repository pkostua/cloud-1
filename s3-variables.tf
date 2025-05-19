variable "bucket-admin-name" {
  type = string
  default = "bucket-admin"
}

variable "bucket-name" {
  type = string
  default = "pkostua-20251905"
}

variable "image-key" {
  type = string
  default = "image.jpg"
}

variable "image-tag" {
  type = string
  default = "picture"
}

variable "image-path" {
  type = string
  default = "./image.jpg"
}

variable "html-key" {
  type = string
  default = "index.html"
}

variable "html-tag" {
  type = string
  default = "html"
}

variable "html-path" {
  type = string
  default = "./index.html"
}

variable "dns-name" {
  default = "pkdp.ru"
  type = string
}

variable "dns-zone-name" {
  default = "pkdp-ru"
  type = string
}

