resource "azurerm_mssql_virtual_network_rule" "mssql_virtual_network_rules" {
  for_each = var.mssql_virtual_network_rules

  name                                 = each.value.name
  server_id                            = each.value.server_id
  subnet_id                            = each.value.subnet_id
  ignore_missing_vnet_service_endpoint = each.value.ignore_missing_vnet_service_endpoint
}
