resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "data_factory_linked_service_data_lake_storage_gen2s" {
  for_each = var.data_factory_linked_service_data_lake_storage_gen2s

  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  url                      = each.value.url
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
  service_principal_id     = each.value.service_principal_id
  service_principal_key    = each.value.service_principal_key
  storage_account_key      = each.value.storage_account_key
  tenant                   = each.value.tenant
  use_managed_identity     = each.value.use_managed_identity
}
