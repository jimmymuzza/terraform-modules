resource "azurerm_management_group" "management_groups" {
  for_each = var.management_groups

  display_name               = each.value.display_name
  name                       = each.value.name
  parent_management_group_id = each.value.parent_management_group_id
  subscription_ids           = each.value.subscription_ids
}

