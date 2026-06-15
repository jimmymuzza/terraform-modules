resource "azurerm_dedicated_host_group" "dedicated_host_groups" {
  for_each = var.dedicated_host_groups

  location                    = each.value.location
  name                        = each.value.name
  platform_fault_domain_count = each.value.platform_fault_domain_count
  resource_group_name         = each.value.resource_group_name
  automatic_placement_enabled = each.value.automatic_placement_enabled
  tags                        = each.value.tags
  zone                        = each.value.zone
}
