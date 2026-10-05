resource "aws_dx_hosted_transit_virtual_interface_accepter" "dx_hosted_transit_virtual_interface_accepters" {
  for_each = var.dx_hosted_transit_virtual_interface_accepters

  dx_gateway_id                    = each.value.dx_gateway_id
  virtual_interface_id             = each.value.virtual_interface_id
  prefix_pool_allocated_count_ipv4 = each.value.prefix_pool_allocated_count_ipv4
  prefix_pool_allocated_count_ipv6 = each.value.prefix_pool_allocated_count_ipv6
  region                           = each.value.region
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all
}
