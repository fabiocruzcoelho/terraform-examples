resource "google_dns_record_set" "devops" {
  name = "rancher.estudosdevops.com.br."
  type = "A"
  ttl  = 1

  managed_zone = "estudosdevops"

  rrdatas = ["${google_compute_address.ipexterno.address}"]
}

resource "google_dns_managed_zone" "devops" {
  name        = "estudosdevops"
  dns_name    = "estudosdevops.com.br."
  description = "Production DNS zone"
}
