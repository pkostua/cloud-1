data "yandex_compute_image" "ubuntu" {
  family = var.vm_ubuntu
}

data "yandex_compute_image" "lamp" {
  image_id = "fd827b91d99psvq5fjit"
}


data "template_file" "lamp_cloudinit" {
  template = file("${path.module}/template/lamp-cloud-init.yml")
  vars = {
    bucket_name = var.bucket-name
  }
}
