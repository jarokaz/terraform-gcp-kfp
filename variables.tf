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

variable "cluster_node_count" {
    description = "The cluster's node count"
    default     = 3
}

variable "cluster_node_type" {
    description = "The cluster's node type"
    default     = "n1-standard-1"
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
