terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "0.46.0"
    }
  }
}

provider "yandex" {
  token     = "${var.cloud_token}"
  cloud_id  = "${var.cloud_id}"
  folder_id = "${var.folder_id}"
  zone      = "${var.zone}"
}

resource "yandex_compute_instance" "vm-name" {
  name = "vm-name"
  hostname = "vm-name"
  platform_id = "standard-v2"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "${var.image_id}"
      size = 40
      type = "network-ssd"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.vm-name-subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/pharma.pub")}"
    serial-port-enable = 1
  }
}

resource "yandex_vpc_network" "vm-name-network" {
  name = "vm-name-network"
}

resource "yandex_vpc_subnet" "vm-name-subnet" {
  name           = "vm-name-subnet"
  zone           = "${var.zone}"
  network_id     = yandex_vpc_network.vm-name-network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}