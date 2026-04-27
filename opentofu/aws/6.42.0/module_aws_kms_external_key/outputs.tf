output "kms_external_keys" {
  description = "All kms_external_key resources"
  value       = aws_kms_external_key.kms_external_keys
}
