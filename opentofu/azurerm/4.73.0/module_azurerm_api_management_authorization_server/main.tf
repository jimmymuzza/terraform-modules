resource "azurerm_api_management_authorization_server" "api_management_authorization_servers" {
  for_each = var.api_management_authorization_servers

  api_management_name          = each.value.api_management_name
  authorization_endpoint       = each.value.authorization_endpoint
  authorization_methods        = each.value.authorization_methods
  client_id                    = each.value.client_id
  client_registration_endpoint = each.value.client_registration_endpoint
  display_name                 = each.value.display_name
  grant_types                  = each.value.grant_types
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  bearer_token_sending_methods = each.value.bearer_token_sending_methods
  client_authentication_method = each.value.client_authentication_method
  client_secret                = each.value.client_secret
  default_scope                = each.value.default_scope
  description                  = each.value.description
  resource_owner_password      = each.value.resource_owner_password
  resource_owner_username      = each.value.resource_owner_username
  support_state                = each.value.support_state
  token_endpoint               = each.value.token_endpoint

  dynamic "token_body_parameter" {
    for_each = each.value.token_body_parameter != null ? each.value.token_body_parameter : []
    content {
      name  = token_body_parameter.value.name
      value = token_body_parameter.value.value
    }
  }
}
