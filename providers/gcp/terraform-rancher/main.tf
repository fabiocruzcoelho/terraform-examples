resource "google_compute_instance" "devops" {
  name         = "${var.name}"
  machine_type = "${var.machinetype}"
  zone         = "${var.zone}"

  tags = ["devops", "ssh"]

  boot_disk {
    initialize_params {
      image = "${var.image}"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = "${google_compute_address.ipexterno.address}"
    }
  }

  metadata {
    sshKeys = "${var.gce_ssh_user}:${file(var.gce_ssh_pub_key_file)}"
  }

  connection {
    type        = "ssh"
    user        = "${var.gce_ssh_user}"
    private_key = "${file(var.gce_ssh_private_key_file)}"
  }

  provisioner "remote-exec" {
    scripts = [
      "scripts/rancher.sh",
    ]
  }
}
