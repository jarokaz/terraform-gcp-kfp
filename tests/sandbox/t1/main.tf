terraform {
    required_version = ">= 0.12"
}

provider "google" {
    project   = "jk-demo1"
}

data "google_project" "project" {}

variable "service_accounts" {
  default = {
      "gke-sa" = {
          description = "GKE service account"
          roles       = [
            "logging.logWriter",
            "monitoring.metricWriter", 
            "monitoring.viewer", 
            "stackdriver.resourceMetadata.writer",
            "storage.objectViewer"
          ]
      }
      "kfp-sa" = {
        description = "KFP service account" 
        roles       = [
          "storage.admin", 
          "bigquery.admin", 
          "automl.admin", 
          "automl.predictor",
          "ml.admin",
          "dataflow.admin"
        ]
      }
    }
}

resource "google_service_account" "service_account" {
    for_each = var.service_accounts
    account_id = each.key 
    display_name = each.value.description
}

locals {
  email_to_role = flatten([ 
    for account_name, account_properties in var.service_accounts: [
        for role in account_properties.roles: 
         "${account_name}@${data.google_project.project.project_id}.iam.gserviceaccount.com~roles/${role}"  
      ]
    ]) 
}

resource "google_project_iam_member" "role_binding" {
  for_each = toset(local.email_to_role)
  role   = split("~", each.value)[1] 
  member =  "serviceAccount:${split("~", each.value)[0]}"
}


output "test2" {
  value = google_project_iam_member.role_binding 
}



