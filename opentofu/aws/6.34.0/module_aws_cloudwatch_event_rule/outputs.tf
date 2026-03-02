output "cloudwatch_event_rules" {
  description = "All cloudwatch_event_rule resources"
  value       = aws_cloudwatch_event_rule.cloudwatch_event_rules
}
