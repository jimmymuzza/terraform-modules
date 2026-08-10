resource "azurerm_synapse_private_link_hub" "synapse_private_link_hubs" {
  for_each = var.synapse_private_link_hubs

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags
}
