output "route53_resolver_firewall_rules" {
  description = "All route53_resolver_firewall_rule resources"
  value       = aws_route53_resolver_firewall_rule.route53_resolver_firewall_rules
}
