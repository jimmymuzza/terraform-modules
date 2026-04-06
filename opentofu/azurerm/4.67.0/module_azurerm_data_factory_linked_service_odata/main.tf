resource "azurerm_data_factory_linked_service_odata" "data_factory_linked_service_odatas" {
  for_each = var.data_factory_linked_service_odatas

  data_factory_id          = each.value.data_factory_id
  name                     = each.value.name
  url                      = each.value.url
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  integration_runtime_name = each.value.integration_runtime_name
  parameters               = each.value.parameters

  dynamic "basic_authentication" {
    for_each = each.value.basic_authentication != null ? each.value.basic_authentication : []
    content {
      password = basic_authentication.value.password
      username = basic_authentication.value.username
    }
  }
}
