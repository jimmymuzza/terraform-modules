output "ecr_lifecycle_policies" {
  description = "All ecr_lifecycle_policy resources"
  value       = aws_ecr_lifecycle_policy.ecr_lifecycle_policies
}
