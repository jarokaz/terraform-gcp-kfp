# Required variables

variable "region" {
  description = "The region for subnetworks in the network"
  type        = string
}

variable "name_prefix" {
  description = "A name prefix used in resource names"
  type        = string
}

# Optional variables

variable "subnet_ip_range" {
  description = "The IP address range for the subnet"
  default     = "10.128.0.0/20"
}

variable "ip_range_pods" {
  description = "The secondary IP address range for the GKE pods"
  default     = "10.12.0.0/20"
}


variable "ip_range_services" {
  description = "The secondary IP address range for the GKE pods"
  default     = "10.14.0.0/20"
}

