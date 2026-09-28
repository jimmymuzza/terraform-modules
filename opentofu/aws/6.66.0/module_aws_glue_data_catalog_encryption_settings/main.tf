resource "aws_glue_data_catalog_encryption_settings" "glue_data_catalog_encryption_settings" {
  for_each = var.glue_data_catalog_encryption_settings

  catalog_id = each.value.catalog_id
  region     = each.value.region

  dynamic "data_catalog_encryption_settings" {
    for_each = each.value.data_catalog_encryption_settings != null ? each.value.data_catalog_encryption_settings : []
    content {

      dynamic "connection_password_encryption" {
        for_each = data_catalog_encryption_settings.value.connection_password_encryption != null ? data_catalog_encryption_settings.value.connection_password_encryption : []
        content {
          return_connection_password_encrypted = connection_password_encryption.value.return_connection_password_encrypted
          aws_kms_key_id                       = connection_password_encryption.value.aws_kms_key_id
        }
      }

      dynamic "encryption_at_rest" {
        for_each = data_catalog_encryption_settings.value.encryption_at_rest != null ? data_catalog_encryption_settings.value.encryption_at_rest : []
        content {
          catalog_encryption_mode         = encryption_at_rest.value.catalog_encryption_mode
          catalog_encryption_service_role = encryption_at_rest.value.catalog_encryption_service_role
          sse_aws_kms_key_id              = encryption_at_rest.value.sse_aws_kms_key_id
        }
      }
    }
  }
}
