resource "azurerm_monitor_private_link_scoped_service" "monitor_private_link_scoped_services" {
  for_each = var.monitor_private_link_scoped_services

  linked_resource_id  = each.value.linked_resource_id
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scope_name          = each.value.scope_name
}
