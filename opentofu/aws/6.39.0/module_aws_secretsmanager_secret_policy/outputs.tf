output "secretsmanager_secret_policies" {
  description = "All secretsmanager_secret_policy resources"
  value       = aws_secretsmanager_secret_policy.secretsmanager_secret_policies
}
