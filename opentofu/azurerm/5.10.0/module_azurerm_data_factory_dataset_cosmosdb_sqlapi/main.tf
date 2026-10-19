resource "azurerm_data_factory_dataset_cosmosdb_sqlapi" "data_factory_dataset_cosmosdb_sqlapis" {
  for_each = var.data_factory_dataset_cosmosdb_sqlapis

  data_factory_id       = each.value.data_factory_id
  linked_service_name   = each.value.linked_service_name
  name                  = each.value.name
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  collection_name       = each.value.collection_name
  description           = each.value.description
  folder                = each.value.folder
  parameters            = each.value.parameters

  dynamic "schema_column" {
    for_each = each.value.schema_column != null ? each.value.schema_column : []
    content {
      name        = schema_column.value.name
      description = schema_column.value.description
      type        = schema_column.value.type
    }
  }
}
