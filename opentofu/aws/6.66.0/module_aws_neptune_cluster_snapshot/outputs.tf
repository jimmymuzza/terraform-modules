output "neptune_cluster_snapshots" {
  description = "All neptune_cluster_snapshot resources"
  value       = aws_neptune_cluster_snapshot.neptune_cluster_snapshots
}
