output "vpc_security_group_egress_rules" {
  description = "All vpc_security_group_egress_rule resources"
  value       = aws_vpc_security_group_egress_rule.vpc_security_group_egress_rules
}
