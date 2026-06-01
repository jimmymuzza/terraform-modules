resource "azurerm_logic_app_integration_account_certificate" "logic_app_integration_account_certificates" {
  for_each = var.logic_app_integration_account_certificates

  integration_account_name = each.value.integration_account_name
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  metadata                 = each.value.metadata
  public_certificate       = each.value.public_certificate

  dynamic "key_vault_key" {
    for_each = each.value.key_vault_key != null ? each.value.key_vault_key : []
    content {
      key_name     = key_vault_key.value.key_name
      key_vault_id = key_vault_key.value.key_vault_id
      key_version  = key_vault_key.value.key_version
    }
  }
}
