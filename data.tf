data "yandex_compute_image" "ubuntu" {
  family = var.vm_ubuntu
}

data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")
  vars = {
    username       = "ubuntu"
    ssh_public_key = local.ssh_key
  }
}
