resource "azurerm_api_management_workspace_named_value" "api_management_workspace_named_values" {
  for_each = var.api_management_workspace_named_values

  api_management_workspace_id = each.value.api_management_workspace_id
  display_name                = each.value.display_name
  name                        = each.value.name
  secret                      = each.value.secret
  tags                        = each.value.tags
  value                       = each.value.value

  dynamic "value_from_key_vault" {
    for_each = each.value.value_from_key_vault != null ? each.value.value_from_key_vault : []
    content {
      secret_id          = value_from_key_vault.value.secret_id
      identity_client_id = value_from_key_vault.value.identity_client_id
    }
  }
}
