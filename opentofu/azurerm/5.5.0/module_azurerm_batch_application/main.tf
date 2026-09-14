resource "azurerm_batch_application" "batch_applications" {
  for_each = var.batch_applications

  account_name        = each.value.account_name
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  allow_updates       = each.value.allow_updates
  default_version     = each.value.default_version
  display_name        = each.value.display_name
}
