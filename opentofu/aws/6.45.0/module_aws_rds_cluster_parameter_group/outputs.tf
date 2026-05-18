output "rds_cluster_parameter_groups" {
  description = "All rds_cluster_parameter_group resources"
  value       = aws_rds_cluster_parameter_group.rds_cluster_parameter_groups
}
