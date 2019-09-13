# Required variables

variable "region" {
  description = "The region for subnetworks in the network"
  type        = string
}

variable "network_name" {
  description = "The network name"
  type        = string
}

variable "subnet_name" {
  description = "The subnte name"
  type        = string
}

variable "pods_ip_range_name" {
  description = "The name of the secondary IP address range for the GKE pods"
}

variable "services_ip_range_name" {
  description = "The name of the secondary IP address range for the GKE services"
}

# Optional variables

variable "subnet_ip_range" {
  description = "The IP address range for the subnet"
  default     = "10.128.0.0/20"
}

variable "pods_ip_range" {
  description = "The secondary IP address range for the GKE pods"
  default     = "10.12.0.0/20"
}


variable "services_ip_range" {
  description = "The secondary IP address range for the GKE pods"
  default     = "10.14.0.0/20"
}

