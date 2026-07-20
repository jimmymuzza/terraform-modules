resource "azurerm_restore_point_collection" "restore_point_collections" {
  for_each = var.restore_point_collections

  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  source_virtual_machine_id = each.value.source_virtual_machine_id
  tags                      = each.value.tags
}
