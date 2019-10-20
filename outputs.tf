output "cluster_endpoint" {
  value = module.kfp_gke_cluster.cluster_endpoint
}
  
output "mysql_instance_name" {
  value = module.ml_metadata_mysql.mysql_instance.name
}
