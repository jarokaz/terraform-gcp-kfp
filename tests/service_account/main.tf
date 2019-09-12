
terraform {
    required_version = ">= 0.12"
}

provider "google" {
    project   = "jk-demo1"
}



variable "service_account_id" {
  default = "sa-test1"
}

variable "service_account_description" {
  default = "Test service account"
}

variable "service_account_roles" {
  default = [
      "storage.admin", 
      "bigquery.admin", 
      "automl.admin", 
      "automl.predictor",
      "ml.admin",
      "dataflow.admin"
    ]
}

module "service_account" {
  source = "../../modules/service_account"
  service_account_id = var.service_account_id
  service_account_display_name = var.service_account_description
  service_account_roles = var.service_account_roles
}

output "test" {
  value = module.service_account.service_account
}