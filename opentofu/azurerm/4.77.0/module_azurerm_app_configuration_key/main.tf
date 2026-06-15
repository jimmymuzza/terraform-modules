resource "azurerm_app_configuration_key" "app_configuration_keys" {
  for_each = var.app_configuration_keys

  configuration_store_id = each.value.configuration_store_id
  key                    = each.value.key
  content_type           = each.value.content_type
  etag                   = each.value.etag
  label                  = each.value.label
  locked                 = each.value.locked
  tags                   = each.value.tags
  type                   = each.value.type
  value                  = each.value.value
  vault_key_reference    = each.value.vault_key_reference
}
