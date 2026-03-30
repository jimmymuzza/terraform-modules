resource "aws_networkfirewall_firewall" "networkfirewall_firewalls" {
  for_each = var.networkfirewall_firewalls

  firewall_policy_arn                 = each.value.firewall_policy_arn
  name                                = each.value.name
  availability_zone_change_protection = each.value.availability_zone_change_protection
  delete_protection                   = each.value.delete_protection
  description                         = each.value.description
  enabled_analysis_types              = each.value.enabled_analysis_types
  firewall_policy_change_protection   = each.value.firewall_policy_change_protection
  region                              = each.value.region
  subnet_change_protection            = each.value.subnet_change_protection
  tags                                = each.value.tags
  tags_all                            = each.value.tags_all
  transit_gateway_id                  = each.value.transit_gateway_id
  vpc_id                              = each.value.vpc_id

  dynamic "availability_zone_mapping" {
    for_each = each.value.availability_zone_mapping != null ? each.value.availability_zone_mapping : []
    content {
      availability_zone_id = availability_zone_mapping.value.availability_zone_id
    }
  }

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      type   = encryption_configuration.value.type
      key_id = encryption_configuration.value.key_id
    }
  }

  dynamic "subnet_mapping" {
    for_each = each.value.subnet_mapping != null ? each.value.subnet_mapping : []
    content {
      subnet_id       = subnet_mapping.value.subnet_id
      ip_address_type = subnet_mapping.value.ip_address_type
    }
  }
}
