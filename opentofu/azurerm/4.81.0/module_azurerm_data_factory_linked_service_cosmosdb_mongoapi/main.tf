resource "azurerm_data_factory_linked_service_cosmosdb_mongoapi" "data_factory_linked_service_cosmosdb_mongoapis" {
  for_each = var.data_factory_linked_service_cosmosdb_mongoapis

  data_factory_id                = each.value.data_factory_id
  name                           = each.value.name
  additional_properties          = each.value.additional_properties
  annotations                    = each.value.annotations
  connection_string              = each.value.connection_string
  database                       = each.value.database
  description                    = each.value.description
  integration_runtime_name       = each.value.integration_runtime_name
  parameters                     = each.value.parameters
  server_version_is_32_or_higher = each.value.server_version_is_32_or_higher
}
