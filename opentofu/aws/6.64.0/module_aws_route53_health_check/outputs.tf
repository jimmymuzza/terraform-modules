output "route53_health_checks" {
  description = "All route53_health_check resources"
  value       = aws_route53_health_check.route53_health_checks
}
