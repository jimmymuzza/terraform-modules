output "vpc_security_group_ingress_rules" {
  description = "All vpc_security_group_ingress_rule resources"
  value       = aws_vpc_security_group_ingress_rule.vpc_security_group_ingress_rules
}
