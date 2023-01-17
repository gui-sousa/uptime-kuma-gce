output "UPTIME-LB-IP" {
  value = format("https://%s", google_compute_forwarding_rule.uptime-lb.ip_address)
}