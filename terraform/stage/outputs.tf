//output "lb_ip" {
//  value = google_compute_global_address.lb-ipv4.address
//}
output "app_external_ip" {
  value = module.app.app_external_ip
}
