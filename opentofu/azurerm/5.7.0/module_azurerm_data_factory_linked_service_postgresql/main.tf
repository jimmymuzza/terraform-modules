resource "azurerm_data_factory_linked_service_postgresql" "data_factory_linked_service_postgresqls" {
  for_each = var.data_factory_linked_service_postgresqls

  connection_string        = each.value.connection_string
  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
}
