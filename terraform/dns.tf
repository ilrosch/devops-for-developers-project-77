resource "yandex_dns_zone" "zone" {
  name                = "hexlet-zone"
  zone                = "${var.domain}."
  public              = true
  private_networks    = [yandex_vpc_network.net.id]
  deletion_protection = true
  depends_on          = [yandex_vpc_network.net]
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone.id
  name    = "${var.domain}."
  type    = "A"
  ttl     = 200
  data    = ["10.0.0.1"]
}

# resource "yandex_cm_certificate" "cm" {
#   name    = "hexlet-cm"
#   domains = [var.domain]
#   managed {
#     challenge_type = "DNS_CNAME"
#   }
# }

data "yandex_cm_certificate" "cm" {
  name = var.yc_ssl
}

resource "yandex_dns_recordset" "dns-cm" {
  count      = 1
  zone_id    = yandex_dns_zone.zone.id
  name       = data.yandex_cm_certificate.cm.challenges[count.index].dns_name
  type       = data.yandex_cm_certificate.cm.challenges[count.index].dns_type
  data       = [data.yandex_cm_certificate.cm.challenges[count.index].dns_value]
  ttl        = 60
  depends_on = [data.yandex_cm_certificate.cm]
}
