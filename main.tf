
terraform {
    required_version = ">= 0.12"
}

provider "google" {
    project   = var.project_id 
}

# Create the GKE service account 
module "gke_service_account" {
  source                       = "./modules/service_account"
  service_account_id           = var.gke_service_account_id
  service_account_display_name = var.gke_service_account_display_name
  service_account_roles        = var.gke_service_account_roles
}

# Create the KFP service account 
module "kfp_service_account" {
  source                       = "./modules/service_account"
  service_account_id           = var.kfp_service_account_id
  service_account_display_name = var.kfp_service_account_display_name
  service_account_roles        = var.kfp_service_account_roles
}

# Create the VPC for the KFP cluster
module "kfp_gke_vpc" {
  source      = "./modules/vpc"
  name_prefix = var.name_prefix
  region      = var.region
}

# Create the KFP GKE cluster
module "kfp_gke_cluster" {
  source            = "./modules/gke"
  name              = "${var.name_prefix}-kfp-cluster"
  location          = var.region
  description       = "KFP GKE cluster"
  sa_full_id        = module.gke_service_account.service_account.email
  network           = module.kfp_gke_vpc.network_name
  subnetwork        = module.kfp_gke_vpc.subnet_name
  ip_range_pods     = module.kfp_gke_vpc.ip_range_pods_name
  ip_range_services = module.kfp_gke_vpc.ip_range_services_name
  node_count        = var.cluster_node_count
  node_type         = var.cluster_node_type
}

# Create the MySQL instance for ML Metadata
module "ml_metadata_mysql" {
  source  = "./modules/mysql"
  region  = var.region
  name    = var.ml_metadata_instance_name 
}

# Create Cloud Storage bucket for artifact Storage
resource "google_storage_bucket" "artifact_store" {
  name = "${var.name_prefix}-artifact-store"
}
