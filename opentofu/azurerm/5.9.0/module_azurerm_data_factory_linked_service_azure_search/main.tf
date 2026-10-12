resource "azurerm_data_factory_linked_service_azure_search" "data_factory_linked_service_azure_searches" {
  for_each = var.data_factory_linked_service_azure_searches

  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  search_service_key       = each.value.search_service_key
  url                      = each.value.url
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters
}
