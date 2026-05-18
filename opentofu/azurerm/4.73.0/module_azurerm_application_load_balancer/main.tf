resource "azurerm_application_load_balancer" "application_load_balancers" {
  for_each = var.application_load_balancers

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
