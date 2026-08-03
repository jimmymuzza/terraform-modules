output "secretsmanager_secrets" {
  description = "All secretsmanager_secret resources"
  value       = aws_secretsmanager_secret.secretsmanager_secrets
}
