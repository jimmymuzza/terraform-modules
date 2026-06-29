resource "azurerm_management_group_subscription_association" "management_group_subscription_associations" {
  for_each = var.management_group_subscription_associations

  management_group_id = each.value.management_group_id
  subscription_id     = each.value.subscription_id
}
