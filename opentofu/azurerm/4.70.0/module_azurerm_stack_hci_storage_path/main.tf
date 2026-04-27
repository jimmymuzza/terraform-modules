resource "azurerm_stack_hci_storage_path" "stack_hci_storage_paths" {
  for_each = var.stack_hci_storage_paths

  custom_location_id  = each.value.custom_location_id
  location            = each.value.location
  name                = each.value.name
  path                = each.value.path
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
