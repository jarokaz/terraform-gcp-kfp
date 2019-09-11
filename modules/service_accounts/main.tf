# Set locals and data sources
locals {
  account_to_role = flatten([
    for account in var.service_accounts: [ 
      for role in account.roles: {
          account_id = account.account_id
          role       = role
      }
    ]
  ])
}


# Create service accounts

resource "google_service_account" "service_account" {
  count  = length(var.service_accounts)
  account_id = var.service_accounts[count.index].account_id 
  display_name =var.service_accounts[count.index].description
}

#resource "google_project_iam_member" "cluster_sa_roles" {
#  count   = length(var.cluster_sa_roles)
#  role    = "roles/${var.cluster_sa_roles[count.index]}"
#  member  = "serviceAccount:${google_service_account.cluster_sa.email}"
#}
#
## Configure the KFP service account 
#
#resource "google_service_account" "kfp_sa" {
#    account_id = var.kfp_sa_id
#    display_name = "KFP Service Account"
#}
#
#resource "google_project_iam_member" "kfp_sa_roles" {
#  count   = length(var.kfp_sa_roles)
#  role    = "roles/${var.kfp_sa_roles[count.index]}"
#  member  = "serviceAccount:${google_service_account.kfp_sa.email}"
#}