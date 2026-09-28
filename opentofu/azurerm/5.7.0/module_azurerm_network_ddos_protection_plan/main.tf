resource "azurerm_network_ddos_protection_plan" "network_ddos_protection_plans" {
  for_each = var.network_ddos_protection_plans

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
