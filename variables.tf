variable "project_id" {
    description = "The GCP project ID"
    type        = string
}

variable "region" {
    description = "The region for the KFP infrastructure"
    type        = string
}

variable "vpc_name" {
    description = "The name of the VPC to host a GKE cluster"
    type        = string
}

variable "subnet_name" {
    description = "The name of the subnet to host a GKE cluster"
    type        = string
    default     = "subnet-01"
}

variable "subnet_ip_range" {
    description = "The subnet's IP range"
    type        = string
    default     = "10.128.0.0/20"
}

variable "pods_ip_range" {
    description = "The secondary IP range for GKE pods"
    type        = string
    default     = "10.12.0.0/20"
}

variable "services_ip_range" {
    description = "The secondary IP range for GKE pods"
    type        = string
    default     = "10.14.0.0/20"
}
variable "cluster_name" {
    description = "The name of the GKE cluster"
    default     = "kfp-gke-cluster"
}

variable "cluster_description" {
    description = "The cluster's description"
    default = "KFP cluster"
}

variable "cluster_node_count" {
    description = "The cluster's node count"
    default     = 3
}

variable "cluster_node_type" {
    description = "The cluster's node type"
    default     = "n1-standard-1"
}

variable "cluster_sa_id" {
    description = "The cluster's service account ID"
    default     = "gke-sa"
}

variable "cluster_sa_roles" {
    description = "The cluster Service Account roles"
    type        = list(string)
    default     = ["logging.logWriter",
                   "monitoring.metricWriter", 
                   "monitoring.viewer", 
                   "stackdriver.resourceMetadata.writer",
                   "storage.objectViewer"]
}

variable "kfp_sa_id" {
    description = "The KFP Service Account ID"
    default     = "kfp-sa"
}

variable "kfp_sa_roles" {
    description = "The KFP Service Account roles"
    type        = list(string)
    default     = ["storage.admin", 
                   "bigquery.admin", 
                   "automl.admin", 
                   "automl.predictor",
                   "ml.admin",
                   "dataflow.admin"]
}
