output "kms_custom_key_stores" {
  description = "All kms_custom_key_store resources"
  value       = aws_kms_custom_key_store.kms_custom_key_stores
}
