resource "azurerm_chaos_studio_target" "chaos_studio_targets" {
  for_each = var.chaos_studio_targets

  location           = each.value.location
  target_resource_id = each.value.target_resource_id
  target_type        = each.value.target_type
}
