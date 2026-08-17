resource "azurerm_application_security_group" "application_security_groups" {
  for_each = var.application_security_groups

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
