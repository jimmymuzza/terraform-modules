resource "azurerm_key_vault_managed_storage_account_sas_token_definition" "key_vault_managed_storage_account_sas_token_definitions" {
  for_each = var.key_vault_managed_storage_account_sas_token_definitions

  managed_storage_account_id = each.value.managed_storage_account_id
  name                       = each.value.name
  sas_template_uri           = each.value.sas_template_uri
  sas_type                   = each.value.sas_type
  validity_period            = each.value.validity_period
  tags                       = each.value.tags
}
