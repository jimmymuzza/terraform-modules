resource "azurerm_container_registry_agent_pool" "container_registry_agent_pools" {
  for_each = var.container_registry_agent_pools

  container_registry_name   = each.value.container_registry_name
  location                  = each.value.location
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  instance_count            = each.value.instance_count
  tags                      = each.value.tags
  tier                      = each.value.tier
  virtual_network_subnet_id = each.value.virtual_network_subnet_id
}
