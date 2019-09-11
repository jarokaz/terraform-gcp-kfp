terraform {
 backend "gcs" {
   bucket  = "jkterraform"
   prefix  = "terraform/state/terraform-gcp-kfp/testing"
 }
}