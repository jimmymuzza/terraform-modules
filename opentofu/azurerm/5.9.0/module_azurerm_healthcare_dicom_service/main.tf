resource "azurerm_healthcare_dicom_service" "healthcare_dicom_services" {
  for_each = var.healthcare_dicom_services

  location                      = each.value.location
  name                          = each.value.name
  workspace_id                  = each.value.workspace_id
  data_partitions_enabled       = each.value.data_partitions_enabled
  encryption_key_url            = each.value.encryption_key_url
  public_network_access_enabled = each.value.public_network_access_enabled
  tags                          = each.value.tags

  dynamic "cors" {
    for_each = each.value.cors != null ? each.value.cors : []
    content {
      allow_credentials  = cors.value.allow_credentials
      allowed_headers    = cors.value.allowed_headers
      allowed_methods    = cors.value.allowed_methods
      allowed_origins    = cors.value.allowed_origins
      max_age_in_seconds = cors.value.max_age_in_seconds
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "storage" {
    for_each = each.value.storage != null ? each.value.storage : []
    content {
      file_system_name   = storage.value.file_system_name
      storage_account_id = storage.value.storage_account_id
    }
  }
}
