output "lambda_permissions" {
  description = "All lambda_permission resources"
  value       = aws_lambda_permission.lambda_permissions
}
