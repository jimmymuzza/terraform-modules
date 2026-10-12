resource "azurerm_graph_services_account" "graph_services_accounts" {
  for_each = var.graph_services_accounts

  application_id      = each.value.application_id
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
