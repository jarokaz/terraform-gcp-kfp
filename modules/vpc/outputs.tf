
output "pods_ip_range_name" {
    value = var.pods_ip_range_name
}
output "services_ip_range_name" {
    value = var.services_ip_range_name
}

output "subnet_name" {
    value = google_compute_subnetwork.subnetwork.name
}

output "network_name" {
    value = google_compute_network.network.name
}