resource "yandex_vpc_network" "net" {
  name = "hexlet-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "hexlet-network"
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.net.id
  v4_cidr_blocks = ["10.0.0.0/24"]
  depends_on     = [yandex_vpc_network.net]
}

resource "yandex_vpc_address" "static-ip" {
  name = "hexlet-static-ip"

  external_ipv4_address {
    zone_id = var.yc_zone
  }
}