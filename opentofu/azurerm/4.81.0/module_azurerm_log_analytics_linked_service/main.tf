resource "azurerm_log_analytics_linked_service" "log_analytics_linked_services" {
  for_each = var.log_analytics_linked_services

  resource_group_name = each.value.resource_group_name
  workspace_id        = each.value.workspace_id
  read_access_id      = each.value.read_access_id
  write_access_id     = each.value.write_access_id
}
