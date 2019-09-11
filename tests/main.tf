terraform {
    required_version = ">= 0.12"
}

provider "google" {
    project   = "jk-demo1"
}

module "kfp_infra" {
    source           = "../"
    project_id       = "jk-demo1"
    vpc_name         = "kfp-vpc"
    region           = "us-west1"
}