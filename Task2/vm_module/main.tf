terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "~> 0.209"
    }
  }
}

provider "yandex" {
  token = var.yc_token
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  zone = var.yac_zone
}

data "yandex_compute_image" "ubuntu" {
  family = var.yac_os_family
}

resource "yandex_compute_disk" "test_disk" {
  name = "${var.vm_name}-disk"
  type = var.yac_disk_type
  zone = var.yac_zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size = var.vm_disk_size
}

resource "yandex_compute_instance" "test_vm" {
  name = var.vm_name
  platform_id = var.yac_platform_id
  zone = var.yac_zone

  resources {
    cores  = var.vm_cpu_cores
    memory = var.vm_ram
  }

  boot_disk {
    disk_id = yandex_compute_disk.test_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = var.vm_nat_enabled
  }
}
