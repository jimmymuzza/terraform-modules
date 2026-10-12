resource "azurerm_data_factory_dataset_http" "data_factory_dataset_https" {
  for_each = var.data_factory_dataset_https

  data_factory_id       = each.value.data_factory_id
  linked_service_name   = each.value.linked_service_name
  name                  = each.value.name
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  description           = each.value.description
  folder                = each.value.folder
  parameters            = each.value.parameters
  relative_url          = each.value.relative_url
  request_body          = each.value.request_body
  request_method        = each.value.request_method

  dynamic "schema_column" {
    for_each = each.value.schema_column != null ? each.value.schema_column : []
    content {
      name        = schema_column.value.name
      description = schema_column.value.description
      type        = schema_column.value.type
    }
  }
}
