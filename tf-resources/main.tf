provider "google" {
  credentials = file("/home/guisousa/bwg-work/keys/adfs-dev.json")
  project     = var.project
  region      = var.region
}
