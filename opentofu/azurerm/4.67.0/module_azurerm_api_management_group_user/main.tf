resource "azurerm_api_management_group_user" "api_management_group_users" {
  for_each = var.api_management_group_users

  api_management_name = each.value.api_management_name
  group_name          = each.value.group_name
  resource_group_name = each.value.resource_group_name
  user_id             = each.value.user_id
}
