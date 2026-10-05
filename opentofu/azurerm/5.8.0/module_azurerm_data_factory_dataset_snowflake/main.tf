resource "azurerm_data_factory_dataset_snowflake" "data_factory_dataset_snowflakes" {
  for_each = var.data_factory_dataset_snowflakes

  data_factory_id       = each.value.data_factory_id
  linked_service_name   = each.value.linked_service_name
  name                  = each.value.name
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  description           = each.value.description
  folder                = each.value.folder
  parameters            = each.value.parameters
  schema_name           = each.value.schema_name
  table_name            = each.value.table_name

  dynamic "schema_column" {
    for_each = each.value.schema_column != null ? each.value.schema_column : []
    content {
      name      = schema_column.value.name
      precision = schema_column.value.precision
      scale     = schema_column.value.scale
      type      = schema_column.value.type
    }
  }
}
