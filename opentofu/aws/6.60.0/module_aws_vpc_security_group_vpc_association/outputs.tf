output "vpc_security_group_vpc_associations" {
  description = "All vpc_security_group_vpc_association resources"
  value       = aws_vpc_security_group_vpc_association.vpc_security_group_vpc_associations
}
