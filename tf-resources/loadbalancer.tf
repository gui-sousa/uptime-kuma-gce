resource "google_compute_http_health_check" "uptime-hc" {
  name               = "uptime-hc"
  request_path       = "/"
  port               = 443
  check_interval_sec = 10
  timeout_sec        = 3
}

resource "google_compute_target_pool" "uptime-target-pool" {
  name             = "uptime-target-pool"
  session_affinity = "NONE"
  region           = var.region

  instances     = [google_compute_instance.uptime.self_link]
  health_checks = [google_compute_http_health_check.uptime-hc.name]
}

resource "google_compute_forwarding_rule" "uptime-lb" {
  name                  = "uptime-lb"
  region                = var.region
  target                = google_compute_target_pool.uptime-target-pool.self_link
  port_range            = "443"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"

}