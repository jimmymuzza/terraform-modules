resource "azurerm_resource_group" "resource_groups" {
  for_each = var.resource_groups

  location   = each.value.location
  name       = each.value.name
  managed_by = each.value.managed_by
  tags       = each.value.tags
}

