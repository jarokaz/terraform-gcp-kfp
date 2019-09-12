variable "project_id" {
    description = "The GCP project ID"
    type        = string
}

variable "region" {
    description = "The region for the KFP infrastructure"
    type        = string
}

variable "name_prefix" {
    description = "The name prefix for the resources"
    type        = string
}

variable "ml_metadata_instance_name" {
    description = "The name of MySQL ML Metadata instance"
    type        = string
}

variable "cluster_node_count" {
    description = "The cluster's node count"
    default     = 3
}

variable "cluster_node_type" {
    description = "The cluster's node type"
    default     = "n1-standard-1"
}

variable "gke_service_account_id" {
  description = "The GKE service account ID"
  default =     "gke-sa"

}

variable "gke_service_account_display_name" {
  description = "The GKE service account display name"
  default     = "The GKE service account"
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

variable "kfp_service_account_id" {
  description = "The KFP service account ID"
  default = "kfp-sa"
}

variable "kfp_service_account_display_name" {
  description = "The KFP service account display name"
  default     = "The KFP service account"
}

variable "kfp_service_account_roles" {
  default = [    
    "storage.admin", 
    "bigquery.admin", 
    "automl.admin", 
    "automl.predictor",
    "ml.admin",
    "dataflow.admin"
  ]
}
