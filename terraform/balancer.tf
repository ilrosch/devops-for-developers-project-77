data "yandex_cm_certificate" "cert" {
  name = var.yc_ssl
}

resource "yandex_alb_http_router" "router" {
  name = "hexlet-router"
}

resource "yandex_alb_virtual_host" "virtual-host" {
  name           = "hexlet-vhost"
  http_router_id = yandex_alb_http_router.router.id
  authority      = ["*"]
  route {
    name = "hexlet-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.backend-group.id
      }
    }
  }
  depends_on = [yandex_alb_backend_group.backend-group]
}

resource "yandex_alb_target_group" "target-group" {
  name = "hexlet-group"
  target {
    subnet_id  = yandex_vpc_subnet.subnet.id
    ip_address = yandex_compute_instance.vm-1.network_interface.0.ip_address
  }
  target {
    subnet_id  = yandex_vpc_subnet.subnet.id
    ip_address = yandex_compute_instance.vm-2.network_interface.0.ip_address
  }
  depends_on = [yandex_compute_instance.vm-1, yandex_compute_instance.vm-2]
}

resource "yandex_alb_backend_group" "backend-group" {
  name = "hexlet-group"

  http_backend {
    name             = "hexlet-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_alb_target_group.target-group.id]
    healthcheck {
      timeout             = "1s"
      interval            = "1s"
      healthy_threshold   = 1
      unhealthy_threshold = 1
      healthcheck_port    = 80
      http_healthcheck {
        path = "/"
      }
    }
  }

  depends_on = [yandex_alb_target_group.target-group]
}

resource "yandex_alb_load_balancer" "alb" {
  name       = "hexlet-balancer"
  network_id = yandex_vpc_network.net.id

  allocation_policy {
    location {
      zone_id   = var.yc_zone
      subnet_id = yandex_vpc_subnet.subnet.id
    }
  }

  listener {
    name = "http-listener"
    endpoint {
      address {
        external_ipv4_address {}
      }
      ports = [80]
    }
    http {
      redirects {
        http_to_https = true
      }
    }
  }

  listener {
    name = "https-listener"
    endpoint {
      address {
        external_ipv4_address {}
      }
      ports = [443]
    }
    tls {
      default_handler {
        certificate_ids = [data.yandex_cm_certificate.cert.id]
        http_handler {
          http_router_id = yandex_alb_http_router.router.id
        }
      }
    }
  }

  depends_on = [yandex_alb_backend_group.backend-group]
}

output "alb_ip" {
  value = yandex_alb_load_balancer.alb.listener[0].endpoint[0].address
}