resource "azurerm_data_protection_resource_guard" "data_protection_resource_guards" {
  for_each = var.data_protection_resource_guards

  location                                = each.value.location
  name                                    = each.value.name
  resource_group_name                     = each.value.resource_group_name
  tags                                    = each.value.tags
  vault_critical_operation_exclusion_list = each.value.vault_critical_operation_exclusion_list
}
