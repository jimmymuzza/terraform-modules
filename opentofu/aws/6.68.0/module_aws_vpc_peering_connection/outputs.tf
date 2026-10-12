output "vpc_peering_connections" {
  description = "All vpc_peering_connection resources"
  value       = aws_vpc_peering_connection.vpc_peering_connections
}
