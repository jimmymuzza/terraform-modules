resource "azurerm_virtual_machine_restore_point_collection" "virtual_machine_restore_point_collections" {
  for_each = var.virtual_machine_restore_point_collections

  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  source_virtual_machine_id = each.value.source_virtual_machine_id
  tags                      = each.value.tags
}
