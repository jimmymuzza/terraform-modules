output "dynamodb_global_secondary_indexes" {
  description = "All dynamodb_global_secondary_index resources"
  value       = aws_dynamodb_global_secondary_index.dynamodb_global_secondary_indexes
}
