resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  for_each = var.vpc_dhcp_options

  domain_name                       = each.value.domain_name
  domain_name_servers               = each.value.domain_name_servers
  ipv6_address_preferred_lease_time = each.value.ipv6_address_preferred_lease_time
  netbios_name_servers              = each.value.netbios_name_servers
  netbios_node_type                 = each.value.netbios_node_type
  ntp_servers                       = each.value.ntp_servers
  region                            = each.value.region
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all
}
