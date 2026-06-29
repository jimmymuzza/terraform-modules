resource "azurerm_eventgrid_partner_namespace" "eventgrid_partner_namespaces" {
  for_each = var.eventgrid_partner_namespaces

  location                     = each.value.location
  name                         = each.value.name
  partner_registration_id      = each.value.partner_registration_id
  resource_group_name          = each.value.resource_group_name
  local_authentication_enabled = each.value.local_authentication_enabled
  partner_topic_routing_mode   = each.value.partner_topic_routing_mode
  public_network_access        = each.value.public_network_access
  tags                         = each.value.tags

  dynamic "inbound_ip_rule" {
    for_each = each.value.inbound_ip_rule != null ? each.value.inbound_ip_rule : []
    content {
      ip_mask = inbound_ip_rule.value.ip_mask
      action  = inbound_ip_rule.value.action
    }
  }
}
