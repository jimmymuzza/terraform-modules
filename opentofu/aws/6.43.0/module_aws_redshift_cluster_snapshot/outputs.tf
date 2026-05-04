output "redshift_cluster_snapshots" {
  description = "All redshift_cluster_snapshot resources"
  value       = aws_redshift_cluster_snapshot.redshift_cluster_snapshots
}
