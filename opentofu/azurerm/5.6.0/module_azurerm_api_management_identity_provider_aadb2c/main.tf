resource "azurerm_api_management_identity_provider_aadb2c" "api_management_identity_provider_aadb2cs" {
  for_each = var.api_management_identity_provider_aadb2cs

  allowed_tenant         = each.value.allowed_tenant
  api_management_name    = each.value.api_management_name
  authority              = each.value.authority
  client_id              = each.value.client_id
  client_secret          = each.value.client_secret
  resource_group_name    = each.value.resource_group_name
  signin_policy          = each.value.signin_policy
  signin_tenant          = each.value.signin_tenant
  signup_policy          = each.value.signup_policy
  client_library         = each.value.client_library
  password_reset_policy  = each.value.password_reset_policy
  profile_editing_policy = each.value.profile_editing_policy
}
