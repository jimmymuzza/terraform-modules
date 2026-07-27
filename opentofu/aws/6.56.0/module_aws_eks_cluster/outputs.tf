output "eks_clusters" {
  description = "All eks_cluster resources"
  value       = aws_eks_cluster.eks_clusters
}
