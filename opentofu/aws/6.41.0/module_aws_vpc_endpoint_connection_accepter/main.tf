resource "aws_vpc_endpoint_connection_accepter" "vpc_endpoint_connection_accepters" {
  for_each = var.vpc_endpoint_connection_accepters

  vpc_endpoint_id         = each.value.vpc_endpoint_id
  vpc_endpoint_service_id = each.value.vpc_endpoint_service_id
  region                  = each.value.region
}
