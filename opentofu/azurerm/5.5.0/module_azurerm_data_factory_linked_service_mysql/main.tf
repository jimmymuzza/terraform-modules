resource "azurerm_data_factory_linked_service_mysql" "data_factory_linked_service_mysqls" {
  for_each = var.data_factory_linked_service_mysqls

  connection_string        = each.value.connection_string
  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  driver_version           = each.value.driver_version
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
}
