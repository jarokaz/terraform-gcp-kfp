# GCP infrastructure for a lightweight Kubeflow Pipelines deployment 
This is an Terraform module that manages provisioning and configuration of an MVP GCP infrastructure to host a lightweight Kubeflow Pipelines deployment.

The module provisions:
- A VPC to host a KFP GKE cluster
- A GKE cluster optimized for running Kubeflow Pipelines
- A Cloud SQL managed MySQL instance to host KFP and ML Metadata databases
- A Cloud Storage bucket to host an artifact repository
- A service account and and IAM roles to be used by KFP pipelines

## Usage
Basic usage is as follows. For a more complete example refer to the (https://github.com/jarokaz/caip-tfx).

```
module "gcp-kfp-infrastructure" {
  source              = "github.com/jarokaz/caip-modules/kfp"
  cluster_location    = "us-central1-a"
```

It may take a few minutes for the cluster and KFP services to come up. After the services start, the KFP UI is available at the following URL: 
```
echo "https://"$(kubectl describe configmap inverse-proxy-config -n kubeflow | grep "googleusercontent.com")
```

## Inputs
|Name|Description|Type|Default|Required|
|----|-----------|----|-------|--------|
|cluster_location|The zone of a host GKE cluster|string|n/a|yes|
|cluster_name|The name of a host GKE cluster|string|`kf-gke-cluster`|no|
|cluster_description|The description of a host GKE cluster|string|`KFP cluster`|no|
|cluster_node_count|The number of nodes in the default node pool. |string|`3`|no|
|cluster_node_type|The type of nodes in the default node pool.|string|`n1-standard-1`|no|
|cluster_sa_id|The name to use as the cluster's service account. The module creates the account and assigns to it the least amount of privileges required to operate the cluster.|string|`gke-sa`|no|
|kfp_sa_id|The name to use as the Kubeflow Pipelines service account. The pipeline steps my elect to execute using this account. The module creates the account, assigns it to the list o specified roles, and stores its private key as the Kubernetes `user_gcp_sa` secret. |list(string)|`tbd`|no|
|kfp_version|The version of Kubeflow Pipelines to install|string|`master`|no|
|kfp_sa_roles|The roles to assign to the KFP Service Account|list(string)|`["storage.admin", "bigquery.admin",  "automl.admin", "automl.predictor", "ml.admin"]`|no|



## Outputs
|Name|Description|
|----|-----------|
|cluster_name|The name of the host cluster|
|cluster_endpoint|The endpoint of the host cluster|


## Requirements
### Software 
- Terraform v0.12 or higher
- Terraform Provider for GCP v2.0 or higher
### Permissions
A user or service account with the following permissions in the target project must be used to provision the resources in this module:
- `roles\editor`
### Enabled APIs
The following cloud APIs must be enabled in the target project
- `compute.googleapis.com`
- `container.googleapis.com`
- `cloudresourcemanager.googleapis.com`
- `iam.googleapis.com`


