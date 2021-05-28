provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_image" "ubuntu_img" {
  name       = "ubuntu-for-docker"
  source_family = "ubuntu-1604-lts"
}

resource "yandex_compute_instance" "app" {
  count = var.instances_count
  name  = "docker-reddit-app${count.index}"

  labels = {
    tags = "docker-reddit-app"
  }
  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.ubuntu_img.id}"
      size = 10
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

}
