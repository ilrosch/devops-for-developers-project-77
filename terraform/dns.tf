resource "yandex_dns_zone" "zone" {
  name                = "hexlet-zone"
  zone                = "${var.domain}."
  public              = true
  private_networks    = [yandex_vpc_network.net.id]
  deletion_protection = false
  depends_on          = [yandex_vpc_network.net]
}

resource "yandex_dns_recordset" "rs1" {
  zone_id = yandex_dns_zone.zone.id
  name    = "${var.domain}."
  type    = "A"
  ttl     = 200
  data    = [yandex_vpc_address.static-ip.external_ipv4_address[0].address]
}

resource "yandex_dns_recordset" "dns-cm" {
  count      = 1
  zone_id    = yandex_dns_zone.zone.id
  name       = yandex_cm_certificate.cm.challenges[count.index].dns_name
  type       = yandex_cm_certificate.cm.challenges[count.index].dns_type
  data       = [yandex_cm_certificate.cm.challenges[count.index].dns_value]
  ttl        = 60
  depends_on = [yandex_cm_certificate.cm]
}
