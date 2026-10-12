resource "azurerm_api_management_user" "api_management_users" {
  for_each = var.api_management_users

  api_management_name = each.value.api_management_name
  email               = each.value.email
  first_name          = each.value.first_name
  last_name           = each.value.last_name
  resource_group_name = each.value.resource_group_name
  user_id             = each.value.user_id
  confirmation        = each.value.confirmation
  note                = each.value.note
  password            = each.value.password
  state               = each.value.state
}
