resource "azurerm_data_factory_linked_service_synapse" "data_factory_linked_service_synapses" {
  for_each = var.data_factory_linked_service_synapses

  connection_string        = each.value.connection_string
  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters

  dynamic "key_vault_password" {
    for_each = each.value.key_vault_password != null ? each.value.key_vault_password : []
    content {
      linked_service_name = key_vault_password.value.linked_service_name
      secret_name         = key_vault_password.value.secret_name
    }
  }
}
