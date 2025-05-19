/*resource "yandex_lb_network_load_balancer" "lb" {
  depends_on          = [yandex_compute_instance_group.lamp_group_instance]
  count               = 1
  name                = "nlb-${var.lamp_group_name}"
  description         = "network load balancer for ${var.lamp_group_name}"
  deletion_protection = false
  listener {
    name        = "listener-${var.lamp_group_name}"
    port        = var.app_port
    target_port = var.app_port
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_compute_instance_group.lamp_group_instance.load_balancer[0].target_group_id
    healthcheck {
      name = "healthcheck-${var.lamp_group_name}"
      tcp_options {
        port = var.app_port
      }
    }
  }
}*/
