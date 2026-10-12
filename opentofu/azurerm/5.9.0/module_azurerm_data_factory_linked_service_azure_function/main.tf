resource "azurerm_data_factory_linked_service_azure_function" "data_factory_linked_service_azure_functions" {
  for_each = var.data_factory_linked_service_azure_functions

  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  url                      = each.value.url
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  key                      = each.value.key
  parameters               = each.value.parameters

  dynamic "key_vault_key" {
    for_each = each.value.key_vault_key != null ? each.value.key_vault_key : []
    content {
      linked_service_name = key_vault_key.value.linked_service_name
      secret_name         = key_vault_key.value.secret_name
    }
  }
}
