resource "aws_vpc_endpoint_private_dns" "vpc_endpoint_private_dns" {
  for_each = var.vpc_endpoint_private_dns

  private_dns_enabled = each.value.private_dns_enabled
  vpc_endpoint_id     = each.value.vpc_endpoint_id
  region              = each.value.region
}
