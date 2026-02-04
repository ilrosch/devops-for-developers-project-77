data "yandex_compute_image" "container-optimized-image" {
  family = "container-optimized-image"
}

resource "yandex_compute_instance" "vm-1" {
  name = "hexlet-vm-1"
  zone = var.yc_zone

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.container-optimized-image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  metadata = {
    ssh-keys = "ilrosch:${file("~/.ssh/id_ed25519.pub")}"
  }

  depends_on = [yandex_vpc_subnet.subnet]
}

resource "yandex_compute_instance" "vm-2" {
  name = "hexlet-vm-2"
  zone = var.yc_zone

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.container-optimized-image.id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  resources {
    core_fraction = 20
    cores         = 2
    memory        = 2
  }

  metadata = {
    ssh-keys = "ilrosch:${file("~/.ssh/id_ed25519.pub")}"
  }

  depends_on = [yandex_vpc_subnet.subnet]
}

