resource "aws_nat_gateway" "nat_gateways" {
  for_each = var.nat_gateways

  allocation_id                      = each.value.allocation_id
  availability_mode                  = each.value.availability_mode
  connectivity_type                  = each.value.connectivity_type
  private_ip                         = each.value.private_ip
  region                             = each.value.region
  secondary_allocation_ids           = each.value.secondary_allocation_ids
  secondary_private_ip_address_count = each.value.secondary_private_ip_address_count
  secondary_private_ip_addresses     = each.value.secondary_private_ip_addresses
  subnet_id                          = each.value.subnet_id
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all
  vpc_id                             = each.value.vpc_id

  dynamic "availability_zone_address" {
    for_each = each.value.availability_zone_address != null ? each.value.availability_zone_address : []
    content {
      allocation_ids       = availability_zone_address.value.allocation_ids
      availability_zone    = availability_zone_address.value.availability_zone
      availability_zone_id = availability_zone_address.value.availability_zone_id
    }
  }
}
