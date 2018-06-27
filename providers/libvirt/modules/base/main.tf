terraform {
  required_version = ">= 0.11.7"
}

resource "libvirt_volume" "centos7_volume" {
  name   = "${var.name_prefix}centos7"
  source = "http://schnell.nue.suse.com/sumaform-images/centos7.qcow2"
  count  = "${var.use_shared_resources ? 0 : (contains(var.images, "centos7") ? 1 : 0)}"
  pool   = "${var.pool}"
}

resource "libvirt_volume" "ubuntu_volume" {
  name   = "${var.name_prefix}ubuntu"
  source = "https://download.opensuse.org/repositories/systemsmanagement:/sumaform:/images:/libvirt/images/ubuntu.x86_64.qcow2"
  count  = "${var.use_shared_resources ? 0 : (contains(var.images, "ubuntu") ? 1 : 0)}"
  pool   = "${var.pool}"
}

output "configuration" {
  depends_on = [
    "libvirt_volume.centos7_module",
    "libvirt_volume.ubuntu_module",
  ]

  value = {
    timezone             = "${var.timezone}"
    ssh_key_path         = "${var.ssh_key_path}"
    name_prefix          = "${var.name_prefix}"
    use_shared_resources = "${var.use_shared_resources}"
    pool                 = "${var.pool}"
    network_name         = "${var.bridge == "" ? var.network_name : ""}"
    bridge               = "${var.bridge}"
  }
}
