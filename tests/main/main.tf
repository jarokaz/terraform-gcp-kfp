terraform {
    required_version = ">= 0.12"
}


module "kfp_infra" {
    source                    = "../.."
    project_id                = "jk-demo1"
    name_prefix               = "caip-dev1"
    region                    = "us-central1"
}

