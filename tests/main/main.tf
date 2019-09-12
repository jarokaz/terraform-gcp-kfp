terraform {
    required_version = ">= 0.12"
}


module "kfp_infra" {
    source                    = "../.."
    project_id                = "jk-demo1"
    name_prefix               = "caip-dev"
    region                    = "us-central1"
    ml_metadata_instance_name = "mlmetadata-sql1" 
}

