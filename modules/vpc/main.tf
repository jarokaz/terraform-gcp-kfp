terraform {
  required_version = ">= 0.12"
}

resource "google_compute_network" "network" {
  name                    = "${var.name_prefix}-network"
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnetwork" {
  name                     = "${var.name_prefix}-subnet"
  region                   = var.region
  network                  = google_compute_network.network.self_link
  ip_cidr_range            = var.subnet_ip_range
  private_ip_google_access = true

  secondary_ip_range {
    range_name =    "${var.name_prefix}-ip-range-pods"
    ip_cidr_range = var.ip_range_pods
  }
  
  secondary_ip_range {
    range_name =    "${var.name_prefix}-ip-range-services"
    ip_cidr_range = var.ip_range_services
  }
  
}