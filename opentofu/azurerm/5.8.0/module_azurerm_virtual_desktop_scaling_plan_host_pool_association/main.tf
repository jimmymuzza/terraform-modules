resource "azurerm_virtual_desktop_scaling_plan_host_pool_association" "virtual_desktop_scaling_plan_host_pool_associations" {
  for_each = var.virtual_desktop_scaling_plan_host_pool_associations

  enabled         = each.value.enabled
  host_pool_id    = each.value.host_pool_id
  scaling_plan_id = each.value.scaling_plan_id
}
