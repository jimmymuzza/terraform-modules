resource "azurerm_postgresql_virtual_network_rule" "postgresql_virtual_network_rules" {
  for_each = var.postgresql_virtual_network_rules

  name                                 = each.value.name
  resource_group_name                  = each.value.resource_group_name
  server_name                          = each.value.server_name
  subnet_id                            = each.value.subnet_id
  ignore_missing_vnet_service_endpoint = each.value.ignore_missing_vnet_service_endpoint
}
