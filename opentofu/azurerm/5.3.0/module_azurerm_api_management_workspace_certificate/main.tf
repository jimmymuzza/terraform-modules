resource "azurerm_api_management_workspace_certificate" "api_management_workspace_certificates" {
  for_each = var.api_management_workspace_certificates

  api_management_workspace_id      = each.value.api_management_workspace_id
  name                             = each.value.name
  certificate_data_base64          = each.value.certificate_data_base64
  key_vault_secret_id              = each.value.key_vault_secret_id
  password                         = each.value.password
  user_assigned_identity_client_id = each.value.user_assigned_identity_client_id
}
