output "cloudwatch_log_groups" {
  description = "All cloudwatch_log_group resources"
  value       = aws_cloudwatch_log_group.cloudwatch_log_groups
}
