resource "azurerm_data_factory_linked_service_sftp" "data_factory_linked_service_sftps" {
  for_each = var.data_factory_linked_service_sftps

  authentication_type        = each.value.authentication_type
  data_factory_id            = each.value.data_factory_id
  host                       = each.value.host
  name                       = each.value.name
  port                       = each.value.port
  username                   = each.value.username
  additional_properties      = each.value.additional_properties
  annotations                = each.value.annotations
  description                = each.value.description
  host_key_fingerprint       = each.value.host_key_fingerprint
  integration_runtime_name   = each.value.integration_runtime_name
  parameters                 = each.value.parameters
  password                   = each.value.password
  private_key_content_base64 = each.value.private_key_content_base64
  private_key_passphrase     = each.value.private_key_passphrase
  private_key_path           = each.value.private_key_path
  skip_host_key_validation   = each.value.skip_host_key_validation

  dynamic "key_vault_password" {
    for_each = each.value.key_vault_password != null ? each.value.key_vault_password : []
    content {
      linked_service_name = key_vault_password.value.linked_service_name
      secret_name         = key_vault_password.value.secret_name
    }
  }

  dynamic "key_vault_private_key_content_base64" {
    for_each = each.value.key_vault_private_key_content_base64 != null ? each.value.key_vault_private_key_content_base64 : []
    content {
      linked_service_name = key_vault_private_key_content_base64.value.linked_service_name
      secret_name         = key_vault_private_key_content_base64.value.secret_name
    }
  }

  dynamic "key_vault_private_key_passphrase" {
    for_each = each.value.key_vault_private_key_passphrase != null ? each.value.key_vault_private_key_passphrase : []
    content {
      linked_service_name = key_vault_private_key_passphrase.value.linked_service_name
      secret_name         = key_vault_private_key_passphrase.value.secret_name
    }
  }
}
