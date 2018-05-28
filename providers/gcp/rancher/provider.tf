// Configure the Google Cloud provider
provider "google" {
  credentials = "${var.credentials_gcp}"
  project     = "${var.projectid_gcp}"
  region      = "${var.regiongcp}"
}
