resource "azurerm_network_manager_connectivity_configuration" "network_manager_connectivity_configurations" {
  for_each = var.network_manager_connectivity_configurations

  connectivity_topology                   = each.value.connectivity_topology
  name                                    = each.value.name
  network_manager_id                      = each.value.network_manager_id
  connected_group_address_overlap_enabled = each.value.connected_group_address_overlap_enabled
  connected_group_private_endpoints_scale = each.value.connected_group_private_endpoints_scale
  delete_existing_peering_enabled         = each.value.delete_existing_peering_enabled
  description                             = each.value.description
  global_mesh_enabled                     = each.value.global_mesh_enabled
  peering_enforcement_enabled             = each.value.peering_enforcement_enabled

  dynamic "applies_to_group" {
    for_each = each.value.applies_to_group != null ? each.value.applies_to_group : []
    content {
      group_connectivity  = applies_to_group.value.group_connectivity
      network_group_id    = applies_to_group.value.network_group_id
      global_mesh_enabled = applies_to_group.value.global_mesh_enabled
      use_hub_gateway     = applies_to_group.value.use_hub_gateway
    }
  }

  dynamic "hub" {
    for_each = each.value.hub != null ? each.value.hub : []
    content {
      resource_id   = hub.value.resource_id
      resource_type = hub.value.resource_type
    }
  }
}
