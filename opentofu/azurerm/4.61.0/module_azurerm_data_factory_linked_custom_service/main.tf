resource "azurerm_data_factory_linked_custom_service" "data_factory_linked_custom_services" {
  for_each = var.data_factory_linked_custom_services

  data_factory_id       = each.value.data_factory_id
  name                  = each.value.name
  type                  = each.value.type
  type_properties_json  = each.value.type_properties_json
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  description           = each.value.description
  parameters            = each.value.parameters

  dynamic "integration_runtime" {
    for_each = each.value.integration_runtime != null ? each.value.integration_runtime : []
    content {
      name       = integration_runtime.value.name
      parameters = integration_runtime.value.parameters
    }
  }
}
