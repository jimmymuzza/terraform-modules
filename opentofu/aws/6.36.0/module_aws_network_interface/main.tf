resource "aws_network_interface" "network_interfaces" {
  for_each = var.network_interfaces

  subnet_id                 = each.value.subnet_id
  description               = each.value.description
  enable_primary_ipv6       = each.value.enable_primary_ipv6
  interface_type            = each.value.interface_type
  ipv4_prefix_count         = each.value.ipv4_prefix_count
  ipv4_prefixes             = each.value.ipv4_prefixes
  ipv6_address_count        = each.value.ipv6_address_count
  ipv6_address_list         = each.value.ipv6_address_list
  ipv6_address_list_enabled = each.value.ipv6_address_list_enabled
  ipv6_addresses            = each.value.ipv6_addresses
  ipv6_prefix_count         = each.value.ipv6_prefix_count
  ipv6_prefixes             = each.value.ipv6_prefixes
  private_ip                = each.value.private_ip
  private_ip_list           = each.value.private_ip_list
  private_ip_list_enabled   = each.value.private_ip_list_enabled
  private_ips               = each.value.private_ips
  private_ips_count         = each.value.private_ips_count
  region                    = each.value.region
  security_groups           = each.value.security_groups
  source_dest_check         = each.value.source_dest_check
  tags                      = each.value.tags
  tags_all                  = each.value.tags_all

  dynamic "attachment" {
    for_each = each.value.attachment != null ? each.value.attachment : []
    content {
      device_index       = attachment.value.device_index
      instance           = attachment.value.instance
      network_card_index = attachment.value.network_card_index
    }
  }
}
