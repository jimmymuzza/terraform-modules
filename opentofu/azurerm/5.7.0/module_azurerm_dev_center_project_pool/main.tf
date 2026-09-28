resource "azurerm_dev_center_project_pool" "dev_center_project_pools" {
  for_each = var.dev_center_project_pools

  dev_box_definition_name                 = each.value.dev_box_definition_name
  dev_center_attached_network_name        = each.value.dev_center_attached_network_name
  dev_center_project_id                   = each.value.dev_center_project_id
  local_administrator_enabled             = each.value.local_administrator_enabled
  location                                = each.value.location
  name                                    = each.value.name
  managed_virtual_network_regions         = each.value.managed_virtual_network_regions
  single_sign_on_enabled                  = each.value.single_sign_on_enabled
  stop_on_disconnect_grace_period_minutes = each.value.stop_on_disconnect_grace_period_minutes
  tags                                    = each.value.tags
}
