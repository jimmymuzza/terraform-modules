resource "aws_networkfirewall_vpc_endpoint_association" "networkfirewall_vpc_endpoint_associations" {
  for_each = var.networkfirewall_vpc_endpoint_associations

  firewall_arn = each.value.firewall_arn
  vpc_id       = each.value.vpc_id
  description  = each.value.description
  region       = each.value.region
  tags         = each.value.tags

  dynamic "subnet_mapping" {
    for_each = each.value.subnet_mapping != null ? each.value.subnet_mapping : []
    content {
      subnet_id       = subnet_mapping.value.subnet_id
      ip_address_type = subnet_mapping.value.ip_address_type
    }
  }
}
