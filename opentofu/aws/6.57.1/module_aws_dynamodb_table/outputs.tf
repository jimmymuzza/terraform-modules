output "dynamodb_tables" {
  description = "All dynamodb_table resources"
  value       = aws_dynamodb_table.dynamodb_tables
}
