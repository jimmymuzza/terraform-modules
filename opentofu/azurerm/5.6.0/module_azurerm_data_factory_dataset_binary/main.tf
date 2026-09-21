resource "azurerm_data_factory_dataset_binary" "data_factory_dataset_binaries" {
  for_each = var.data_factory_dataset_binaries

  data_factory_id       = each.value.data_factory_id
  linked_service_name   = each.value.linked_service_name
  name                  = each.value.name
  additional_properties = each.value.additional_properties
  annotations           = each.value.annotations
  description           = each.value.description
  folder                = each.value.folder
  parameters            = each.value.parameters

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

  dynamic "compression" {
    for_each = each.value.compression != null ? each.value.compression : []
    content {
      type  = compression.value.type
      level = compression.value.level
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

  dynamic "sftp_server_location" {
    for_each = each.value.sftp_server_location != null ? each.value.sftp_server_location : []
    content {
      filename                 = sftp_server_location.value.filename
      path                     = sftp_server_location.value.path
      dynamic_filename_enabled = sftp_server_location.value.dynamic_filename_enabled
      dynamic_path_enabled     = sftp_server_location.value.dynamic_path_enabled
    }
  }
}
