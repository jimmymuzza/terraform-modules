output "vpc_peering_connection_accepters" {
  description = "All vpc_peering_connection_accepter resources"
  value       = aws_vpc_peering_connection_accepter.vpc_peering_connection_accepters
}
