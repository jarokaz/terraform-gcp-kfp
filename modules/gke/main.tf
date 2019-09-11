# Create a GKE cluster 

resource "google_container_cluster" "kfp_cluster" {
  name               = var.cluster_name
  location           = var.region
  description        = var.cluster_description

  initial_node_count = var.cluster_node_count

  node_config {
    machine_type = var.cluster_node_type

    metadata = {
      disable-legacy-endpoints = "true"
    }

    service_account = google_service_account.cluster_sa.email

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

}