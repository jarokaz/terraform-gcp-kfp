terraform {
  required_version = ">= 0.12"
}

resource "google_compute_network" "network" {
  name                    = var.network_name
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnetwork" {
  name                     = var.subnet_name
  region                   = var.region
  network                  = google_compute_network.network.self_link
  ip_cidr_range            = var.subnet_ip_range
  private_ip_google_access = true

  secondary_ip_range {
    range_name =    var.pods_ip_range_name
    ip_cidr_range = var.pods_ip_range
  }
  
  secondary_ip_range {
    range_name =    var.services_ip_range_name
    ip_cidr_range = var.services_ip_range
  }
  
}