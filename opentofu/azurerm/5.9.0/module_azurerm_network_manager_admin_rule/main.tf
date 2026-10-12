resource "azurerm_network_manager_admin_rule" "network_manager_admin_rules" {
  for_each = var.network_manager_admin_rules

  action                   = each.value.action
  admin_rule_collection_id = each.value.admin_rule_collection_id
  direction                = each.value.direction
  name                     = each.value.name
  priority                 = each.value.priority
  protocol                 = each.value.protocol
  description              = each.value.description
  destination_port_ranges  = each.value.destination_port_ranges
  source_port_ranges       = each.value.source_port_ranges

  dynamic "destination" {
    for_each = each.value.destination != null ? each.value.destination : []
    content {
      address_prefix      = destination.value.address_prefix
      address_prefix_type = destination.value.address_prefix_type
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      address_prefix      = source.value.address_prefix
      address_prefix_type = source.value.address_prefix_type
    }
  }
}
