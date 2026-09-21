resource "azurerm_firewall_nat_rule_collection" "firewall_nat_rule_collections" {
  for_each = var.firewall_nat_rule_collections

  action              = each.value.action
  azure_firewall_name = each.value.azure_firewall_name
  name                = each.value.name
  priority            = each.value.priority
  resource_group_name = each.value.resource_group_name

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      destination_addresses = rule.value.destination_addresses
      destination_ports     = rule.value.destination_ports
      name                  = rule.value.name
      protocols             = rule.value.protocols
      translated_address    = rule.value.translated_address
      translated_port       = rule.value.translated_port
      description           = rule.value.description
      source_addresses      = rule.value.source_addresses
      source_ip_groups      = rule.value.source_ip_groups
    }
  }
}
