provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_project_metadata" "default" {
  metadata {
    ssh-keys = "appuser1:${file(var.public_key_path)}"
  }
}

resource "google_compute_instance" "docker" {
  name         = "reddit-docker-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  tags         = ["reddit-docker"]
  count        = "${var.count}"

  #Определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
    }
  }

  #Определение сетевого интерфейса
  network_interface {
    #Сеть, к которой присоединить данный интерфейс
    network = "default"

    #Использовать ephemeral ip для доступа в интернет
    access_config {}
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    user        = "appuser"
    agent       = "false"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install docker",
      "sudo systemctl enable docker",
      "sudo systemctl start docker",
      "sudo docker run --name reddit -d -p 9292:9292 aleshkashell/otus-reddit:1.0"
    ]
  }
}

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-default"

  # Название сети, в которой действует правило
  network = "default"

  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]

  # Правило применимо для инстансов с тегом  ... 
  target_tags = ["reddit-app"]
}
