output "cloudwatch_metric_alarms" {
  description = "All cloudwatch_metric_alarm resources"
  value       = aws_cloudwatch_metric_alarm.cloudwatch_metric_alarms
}
