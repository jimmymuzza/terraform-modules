output "vpc_endpoint_security_group_associations" {
  description = "All vpc_endpoint_security_group_association resources"
  value       = aws_vpc_endpoint_security_group_association.vpc_endpoint_security_group_associations
}
