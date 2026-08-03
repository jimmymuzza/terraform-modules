output "secretsmanager_secret_versions" {
  description = "All secretsmanager_secret_version resources"
  value       = aws_secretsmanager_secret_version.secretsmanager_secret_versions
}
