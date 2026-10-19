resource "azurerm_data_factory_linked_service_cosmosdb" "data_factory_linked_service_cosmosdbs" {
  for_each = var.data_factory_linked_service_cosmosdbs

  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  account_endpoint         = each.value.account_endpoint
  account_key              = each.value.account_key
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  connection_string        = each.value.connection_string
  database                 = each.value.database
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
}
