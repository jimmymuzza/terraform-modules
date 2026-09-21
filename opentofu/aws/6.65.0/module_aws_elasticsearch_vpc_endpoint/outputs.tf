output "elasticsearch_vpc_endpoints" {
  description = "All elasticsearch_vpc_endpoint resources"
  value       = aws_elasticsearch_vpc_endpoint.elasticsearch_vpc_endpoints
}
