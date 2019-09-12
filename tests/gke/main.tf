terraform {
    required_version = ">= 0.12"
}

provider "google" {
    project   = "jk-demo1"
}



variable "region" {
  default = "us-central1"
}

variable "name_prefix" {
  default = "kfp-gke"
}


module "vpc" {
  source = "../../modules/vpc"
  region = var.region
  name_prefix = var.name_prefix
}

output "test1" {
  value = module.vpc.ip_range_pods_name
}


output "test2" {
  value = module.vpc.ip_range_services_name
}


output "test3" {
  value = module.vpc.subnet_name
}

