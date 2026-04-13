resource "azurerm_iothub_dps" "iothub_dps" {
  for_each = var.iothub_dps

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  allocation_policy             = each.value.allocation_policy
  data_residency_enabled        = each.value.data_residency_enabled
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags

  dynamic "ip_filter_rule" {
    for_each = each.value.ip_filter_rule != null ? each.value.ip_filter_rule : []
    content {
      action  = ip_filter_rule.value.action
      ip_mask = ip_filter_rule.value.ip_mask
      name    = ip_filter_rule.value.name
      target  = ip_filter_rule.value.target
    }
  }

  dynamic "linked_hub" {
    for_each = each.value.linked_hub != null ? each.value.linked_hub : []
    content {
      connection_string       = linked_hub.value.connection_string
      location                = linked_hub.value.location
      allocation_weight       = linked_hub.value.allocation_weight
      apply_allocation_policy = linked_hub.value.apply_allocation_policy
    }
  }

  dynamic "sku" {
    for_each = each.value.sku != null ? each.value.sku : []
    content {
      capacity = sku.value.capacity
      name     = sku.value.name
    }
  }
}
