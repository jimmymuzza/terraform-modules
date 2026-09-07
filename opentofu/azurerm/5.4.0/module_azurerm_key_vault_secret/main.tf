resource "azurerm_key_vault_secret" "key_vault_secrets" {
  for_each = var.key_vault_secrets

  key_vault_id     = each.value.key_vault_id
  name             = each.value.name
  content_type     = each.value.content_type
  expiration_date  = each.value.expiration_date
  not_before_date  = each.value.not_before_date
  tags             = each.value.tags
  value            = each.value.value
  value_wo         = each.value.value_wo
  value_wo_version = each.value.value_wo_version
}
