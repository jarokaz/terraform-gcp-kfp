
output "ip_range_pods_name" {
    value = "${var.name_prefix}-ip-range-pods"
}
output "ip_range_services_name" {
    value = "${var.name_prefix}-ip-range-services"
}

output "subnet_name" {
    value = google_compute_subnetwork.subnetwork.name
}

output "network_name" {
    value = google_compute_network.network.name
}