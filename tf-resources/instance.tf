resource "google_compute_instance" "uptime" {
  project      = var.project
  zone         = var.zone
  name         = "uptime-test"
  machine_type = var.vm
  boot_disk {
    initialize_params {
      image = "debian-11-uptime-docker"
    }
  }
  network_interface {
    network    = "uptime-network1"
    subnetwork = google_compute_subnetwork.subnet_uptime.id
  }

  metadata_startup_script = "cd /bwg-uptime/config-files/ && docker-compose up -d"
}

/*resource "null_resource" "uptime-delete-image" {
  provisioner "local-exec" {
    command = "gcloud compute images delete debian-11-uptime-docker --quiet"
  }

  depends_on = [
    google_compute_instance.uptime
  ]

}*/