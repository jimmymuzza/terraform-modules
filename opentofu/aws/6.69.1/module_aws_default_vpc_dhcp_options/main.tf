resource "aws_default_vpc_dhcp_options" "default_vpc_dhcp_options" {
  for_each = var.default_vpc_dhcp_options

  owner_id = each.value.owner_id
  region   = each.value.region
  tags     = each.value.tags
  tags_all = each.value.tags_all
}
