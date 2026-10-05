resource "azurerm_data_factory_linked_service_key_vault" "data_factory_linked_service_key_vaults" {
  for_each = var.data_factory_linked_service_key_vaults

  data_factory_id          = each.value.data_factory_id
  key_vault_id             = each.value.key_vault_id
  name                     = each.value.name
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
}
