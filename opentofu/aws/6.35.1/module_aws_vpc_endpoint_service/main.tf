resource "aws_vpc_endpoint_service" "vpc_endpoint_services" {
  for_each = var.vpc_endpoint_services

  acceptance_required        = each.value.acceptance_required
  allowed_principals         = each.value.allowed_principals
  gateway_load_balancer_arns = each.value.gateway_load_balancer_arns
  network_load_balancer_arns = each.value.network_load_balancer_arns
  private_dns_name           = each.value.private_dns_name
  region                     = each.value.region
  supported_ip_address_types = each.value.supported_ip_address_types
  supported_regions          = each.value.supported_regions
  tags                       = each.value.tags
  tags_all                   = each.value.tags_all
}
