variable "cluster_name" {
    description = "The name of the GKE cluster"
    default     = "kfp-gke-cluster"
}

variable "cluster_description" {
    description = "The cluster's description"
    default = "KFP cluster"
}

variable "location" {
    description = "The of the GKE cluster"
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

variable "cluster_sa_id" {
    description = "The cluster's service account ID"
}