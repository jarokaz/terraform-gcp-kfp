
terraform {
    required_version = ">= 0.12"
}

provider "google" {
    project   = "jk-demo1"
}

variable "service_accounts" {
  default = [
    {
      account_id  = "gke-sa"
      description = "The cluster service account"
      roles       = [
        "logging.logWriter",
        "monitoring.metricWriter", 
        "monitoring.viewer", 
        "stackdriver.resourceMetadata.writer",
        "storage.objectViewer"
      ]
    },
    {
      account_id  = "kfp-sa"
      description = "The KFP service account"
      roles       = [
        "storage.admin", 
        "bigquery.admin", 
        "automl.admin", 
        "automl.predictor",
        "ml.admin",
        "dataflow.admin"
      ]
    }
  ]
}


module "service_accounts" {
  source = "../../modules/service_accounts"
  service_accounts = var.service_accounts
}

output "test" {
  value = module.service_accounts.test
}