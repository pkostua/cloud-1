#1. Создать пустую VPC
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#2.1 Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
resource "yandex_vpc_subnet" "public" {
  name           = var.public_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.public_cidr
}
/*
#2.2 Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
resource "yandex_compute_instance" "nat_instance" {
  name        = var.vm_nat_instance_name
  zone        = var.default_zone
  platform_id = var.default_platform_id

  resources {
    cores  = var.vm_default_cores
    memory = var.vm_default_memory
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_default_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat      = true
    ip_address = var.vm_nat_ip
  }
}

#2.3 Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.

resource "yandex_compute_instance" "public_instance" {
  name        = var.vm_public_name
  zone        = var.default_zone
  platform_id = var.default_platform_id

  resources {
    cores  = var.vm_default_cores
    memory = var.vm_default_memory
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    ip_address = var.vm_public_ip
    nat      = true
  }

  metadata = {
    ssh-keys = "ubuntu: ${local.ssh_key}"

  }
}

# 3.1 Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
resource "yandex_vpc_subnet" "private" {
  name           = var.private_subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.private_cidr
  route_table_id = yandex_vpc_route_table.private_route_table.id
}

#3.2 Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
resource "yandex_vpc_route_table" "private_route_table" {
  name     = var.private_route_table_name
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = var.dest_prefix_all
    next_hop_address = var.vm_nat_ip
  }
}

#3.3 Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.
resource "yandex_compute_instance" "private_instance" {
  name        = var.vm_private_name
  zone        =  var.default_zone
  platform_id = var.default_platform_id

  resources {
    cores  = var.vm_default_cores
    memory = var.vm_default_memory
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }


  network_interface {
    subnet_id   = yandex_vpc_subnet.private.id
    ip_address   = var.vm_private_ip
    nat         = false
  }


  metadata = {
    ssh-keys = "ubuntu: ${local.ssh_key}"

  }

}*/
