output "glacier_vault_locks" {
  description = "All glacier_vault_lock resources"
  value       = aws_glacier_vault_lock.glacier_vault_locks
}
