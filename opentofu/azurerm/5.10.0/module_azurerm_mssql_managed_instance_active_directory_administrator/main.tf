resource "azurerm_mssql_managed_instance_active_directory_administrator" "mssql_managed_instance_active_directory_administrators" {
  for_each = var.mssql_managed_instance_active_directory_administrators

  login_username              = each.value.login_username
  managed_instance_id         = each.value.managed_instance_id
  object_id                   = each.value.object_id
  tenant_id                   = each.value.tenant_id
  azuread_authentication_only = each.value.azuread_authentication_only
}
