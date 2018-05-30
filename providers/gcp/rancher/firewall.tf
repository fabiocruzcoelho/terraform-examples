resource "google_compute_firewall" "devops" {
  name    = "estudosdevops"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "443", "80", "6443", "2379-2380", "8080", "1000-2000", "10250-10256", "30000-32767", "8472"]
  }

  target_tags = ["devops"]
}
