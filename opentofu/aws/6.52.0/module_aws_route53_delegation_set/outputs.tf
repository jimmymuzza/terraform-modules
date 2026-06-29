output "route53_delegation_sets" {
  description = "All route53_delegation_set resources"
  value       = aws_route53_delegation_set.route53_delegation_sets
}
