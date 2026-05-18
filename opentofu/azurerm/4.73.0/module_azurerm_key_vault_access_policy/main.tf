resource "azurerm_key_vault_access_policy" "key_vault_access_policies" {
  for_each = var.key_vault_access_policies

  key_vault_id            = each.value.key_vault_id
  object_id               = each.value.object_id
  tenant_id               = each.value.tenant_id
  application_id          = each.value.application_id
  certificate_permissions = each.value.certificate_permissions
  key_permissions         = each.value.key_permissions
  secret_permissions      = each.value.secret_permissions
  storage_permissions     = each.value.storage_permissions
}
