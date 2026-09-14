output "egress_only_internet_gateways" {
  description = "All egress_only_internet_gateway resources"
  value       = aws_egress_only_internet_gateway.egress_only_internet_gateways
}
