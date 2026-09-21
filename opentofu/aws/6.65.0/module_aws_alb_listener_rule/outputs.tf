output "alb_listener_rules" {
  description = "All alb_listener_rule resources"
  value       = aws_alb_listener_rule.alb_listener_rules
}
