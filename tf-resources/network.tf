resource "google_compute_network" "vpc_uptime" {
  project = var.project
  name    = "uptime-network1"
  mtu     = 1460
}

resource "google_compute_subnetwork" "subnet_uptime" {
  name          = var.subnet
  ip_cidr_range = "192.168.1.0/24"
  region        = var.region
  network       = google_compute_network.vpc_uptime.id

}

/*resource "google_compute_router" "nat-uptime-router" {
  project = var.project
  name    = "nat-uptime-router"
  network = google_compute_network.vpc_uptime.id
  region  = var.region
}

module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 4.0"
  project = var.project
  name    = "nat-uptime"
  network = google_compute_network.vpc_uptime.id
  region  = var.region

  nats = [{
    name = "nat-uptime-gateway"
  }]
}*/

resource "google_compute_firewall" "rules" {
  project = var.project
  name    = "allow-ssh"
  network = google_compute_network.vpc_uptime.id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
}