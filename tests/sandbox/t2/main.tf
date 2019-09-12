variable "gke_service_account_name" {
  description = "The name of the GKE service account"
  default     = "gke-sa" 
}

variable "gke_service_account_roles" {
  description = "The roles to assign to the GKE service account"
  default = [
    "logging.logWriter",
    "monitoring.metricWriter", 
    "monitoring.viewer", 
    "stackdriver.resourceMetadata.writer",
    "storage.objectViewer" 
  ] 
}

variable "kfp_service_account_name" {
  description = "The name of the KFP service account"
  default =  "kfp-sa" 
}

variable "kfp_service_account_roles" {
  description = "The roles to assign to the KFP service account"
  default  = [
    "storage.admin", 
    "bigquery.admin", 
    "automl.admin", 
    "automl.predictor",
    "ml.admin",
    "dataflow.admin"
  ]
}

locals {
  service_accounts = {
    "${var.gke_service_account_name}" = {
      var.gke_service_account_roles
    "${var.kfp_service_account_name}" = var.kfp_service_account_roles
  }
}

output  "test" {
  value = local.service_accounts
}