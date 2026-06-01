output "kms_replica_keys" {
  description = "All kms_replica_key resources"
  value       = aws_kms_replica_key.kms_replica_keys
}
