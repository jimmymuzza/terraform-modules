resource "azurerm_data_factory_dataset_delimited_text" "data_factory_dataset_delimited_texts" {
  for_each = var.data_factory_dataset_delimited_texts

  data_factory_id       = each.value.data_factory_id
  linked_service_name   = each.value.linked_service_name
  name                  = each.value.name
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  column_delimiter      = each.value.column_delimiter
  compression_codec     = each.value.compression_codec
  compression_level     = each.value.compression_level
  description           = each.value.description
  encoding              = each.value.encoding
  escape_character      = each.value.escape_character
  first_row_as_header   = each.value.first_row_as_header
  folder                = each.value.folder
  null_value            = each.value.null_value
  parameters            = each.value.parameters
  quote_character       = each.value.quote_character
  row_delimiter         = each.value.row_delimiter

  dynamic "azure_blob_fs_location" {
    for_each = each.value.azure_blob_fs_location != null ? each.value.azure_blob_fs_location : []
    content {
      dynamic_file_system_enabled = azure_blob_fs_location.value.dynamic_file_system_enabled
      dynamic_filename_enabled    = azure_blob_fs_location.value.dynamic_filename_enabled
      dynamic_path_enabled        = azure_blob_fs_location.value.dynamic_path_enabled
      file_system                 = azure_blob_fs_location.value.file_system
      filename                    = azure_blob_fs_location.value.filename
      path                        = azure_blob_fs_location.value.path
    }
  }

  dynamic "azure_blob_storage_location" {
    for_each = each.value.azure_blob_storage_location != null ? each.value.azure_blob_storage_location : []
    content {
      container                 = azure_blob_storage_location.value.container
      dynamic_container_enabled = azure_blob_storage_location.value.dynamic_container_enabled
      dynamic_filename_enabled  = azure_blob_storage_location.value.dynamic_filename_enabled
      dynamic_path_enabled      = azure_blob_storage_location.value.dynamic_path_enabled
      filename                  = azure_blob_storage_location.value.filename
      path                      = azure_blob_storage_location.value.path
    }
  }

  dynamic "http_server_location" {
    for_each = each.value.http_server_location != null ? each.value.http_server_location : []
    content {
      filename                 = http_server_location.value.filename
      path                     = http_server_location.value.path
      relative_url             = http_server_location.value.relative_url
      dynamic_filename_enabled = http_server_location.value.dynamic_filename_enabled
      dynamic_path_enabled     = http_server_location.value.dynamic_path_enabled
    }
  }

  dynamic "schema_column" {
    for_each = each.value.schema_column != null ? each.value.schema_column : []
    content {
      name        = schema_column.value.name
      description = schema_column.value.description
      type        = schema_column.value.type
    }
  }
}
