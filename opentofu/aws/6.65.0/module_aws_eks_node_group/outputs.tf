output "eks_node_groups" {
  description = "All eks_node_group resources"
  value       = aws_eks_node_group.eks_node_groups
}
