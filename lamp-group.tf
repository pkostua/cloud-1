/*module "lamp-group-sa" {
  source = "./sa"
  folder_id = var.folder_id
  name = "${var.lamp_group_name}-admin"
  roles = ["editor"]
}

resource "yandex_compute_instance_group" "lamp_group_instance" {
  name        = "${var.lamp_group_name}-instance"
  service_account_id = module.lamp-group-sa.id

  instance_template {

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
        image_id = data.yandex_compute_image.lamp.image_id
      }
    }


    network_interface {
      subnet_ids = [yandex_vpc_subnet.public.id]
      nat      = true
    }

    metadata = {
      serial-port-enable=1
      ssh-keys = "ubuntu: ${local.ssh_key}"
      user-data = data.template_file.lamp_cloudinit.rendered
    }
  }

  load_balancer {
    target_group_name            = var.lamp_group_name
    target_group_description     = ""
    max_opening_traffic_duration = 300

  }
  allocation_policy {
    zones = [var.default_zone]
  }

  scale_policy {
    fixed_scale {
      size = 3
    }
  }

  deploy_policy {
    max_expansion   = 1
    max_unavailable = 2
  }

  health_check {
    interval   = 10
    timeout    = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
    http_options {
      path = "/"
      port = var.app_port
    }
  }
}


*/