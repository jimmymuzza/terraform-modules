resource "azurerm_data_factory_dataset_azure_blob" "data_factory_dataset_azure_blobs" {
  for_each = var.data_factory_dataset_azure_blobs

  data_factory_id          = each.value.data_factory_id
  linked_service_name      = each.value.linked_service_name
  name                     = each.value.name
  additional_properties    = each.value.additional_properties
  annotations              = each.value.annotations
  description              = each.value.description
  dynamic_filename_enabled = each.value.dynamic_filename_enabled
  dynamic_path_enabled     = each.value.dynamic_path_enabled
  filename                 = each.value.filename
  folder                   = each.value.folder
  parameters               = each.value.parameters
  path                     = each.value.path

  dynamic "schema_column" {
    for_each = each.value.schema_column != null ? each.value.schema_column : []
    content {
      name        = schema_column.value.name
      description = schema_column.value.description
      type        = schema_column.value.type
    }
  }
}
