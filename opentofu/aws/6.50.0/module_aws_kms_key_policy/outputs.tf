output "kms_key_policies" {
  description = "All kms_key_policy resources"
  value       = aws_kms_key_policy.kms_key_policies
}
