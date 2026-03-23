output "kms_keys" {
  description = "All kms_key resources"
  value       = aws_kms_key.kms_keys
}
