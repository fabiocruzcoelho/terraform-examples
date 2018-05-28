resource "google_compute_address" "ipexterno" {
  name         = "${var.name}"
  region       = "${var.regiongcp}"
  address_type = "EXTERNAL"
}
