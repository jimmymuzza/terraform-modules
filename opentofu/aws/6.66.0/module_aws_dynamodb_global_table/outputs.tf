output "dynamodb_global_tables" {
  description = "All dynamodb_global_table resources"
  value       = aws_dynamodb_global_table.dynamodb_global_tables
}
