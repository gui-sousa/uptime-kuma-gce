resource "google_compute_instance" "uptime" {
  project      = var.project
  zone         = var.zone
  name         = "bee-uptime"
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

  /*lifecycle {
    create_before_destroy = true
  }*/

  metadata_startup_script = <<-EOF
  cd /bwg-uptime/config-files/
  sudo wget -L https://raw.githubusercontent.com/gui-sousa/uptime-kuma-gce/master/pkr-deploy/config-files/docker-compose.yaml
  docker-compose up -d
  EOF
}



/*resource "null_resource" "uptime-delete-image" {
  provisioner "local-exec" {
    command = "gcloud compute images delete debian-11-uptime-docker --quiet"
  }

  depends_on = [
    google_compute_instance.uptime
  ]

}*/