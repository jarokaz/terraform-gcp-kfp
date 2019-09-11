# Set locals and data sources

data "google_project" "project" {}
data "google_client_config" "default" {}


# Configure the cluster service account 

resource "google_service_account" "cluster_sa" {
    account_id = var.cluster_sa_id
    display_name = "The cluster service account"
}

resource "google_project_iam_member" "cluster_sa_roles" {
  count   = length(var.cluster_sa_roles)
  role    = "roles/${var.cluster_sa_roles[count.index]}"
  member  = "serviceAccount:${google_service_account.cluster_sa.email}"
}

# Configure the KFP service account 

resource "google_service_account" "kfp_sa" {
    account_id = var.kfp_sa_id
    display_name = "KFP Service Account"
}

resource "google_project_iam_member" "kfp_sa_roles" {
  count   = length(var.kfp_sa_roles)
  role    = "roles/${var.kfp_sa_roles[count.index]}"
  member  = "serviceAccount:${google_service_account.kfp_sa.email}"
}


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