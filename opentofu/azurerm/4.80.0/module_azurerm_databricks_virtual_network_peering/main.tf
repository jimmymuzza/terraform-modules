resource "azurerm_databricks_virtual_network_peering" "databricks_virtual_network_peerings" {
  for_each = var.databricks_virtual_network_peerings

  name                          = each.value.name
  remote_address_space_prefixes = each.value.remote_address_space_prefixes
  remote_virtual_network_id     = each.value.remote_virtual_network_id
  resource_group_name           = each.value.resource_group_name
  workspace_id                  = each.value.workspace_id
  allow_forwarded_traffic       = each.value.allow_forwarded_traffic
  allow_gateway_transit         = each.value.allow_gateway_transit
  allow_virtual_network_access  = each.value.allow_virtual_network_access
  use_remote_gateways           = each.value.use_remote_gateways
}
