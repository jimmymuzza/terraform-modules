output "cloudwatch_alarm_mute_rules" {
  description = "All cloudwatch_alarm_mute_rule resources"
  value       = aws_cloudwatch_alarm_mute_rule.cloudwatch_alarm_mute_rules
}
