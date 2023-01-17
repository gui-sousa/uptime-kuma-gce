provider "google" {
  credentials = file("/home/guisousa/bwg-work/uptime-kauma-gke/uptime-gce/keys/adfs-dev.json")
  project     = var.project
  region      = var.region
}
