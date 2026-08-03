variable "network_manager_connectivity_configurations" {
  description = <<EOT
Map of network_manager_connectivity_configurations, attributes below
Required:
    - connectivity_topology
    - name
    - network_manager_id
    - applies_to_group
Optional:
    - connected_group_address_overlap_enabled
    - connected_group_private_endpoints_scale
    - delete_existing_peering_enabled
    - description
    - global_mesh_enabled
    - peering_enforcement_enabled
    - hub
EOT

  type = map(object({
    connectivity_topology                   = string
    name                                    = string
    network_manager_id                      = string
    connected_group_address_overlap_enabled = optional(bool)
    connected_group_private_endpoints_scale = optional(string)
    delete_existing_peering_enabled         = optional(bool)
    description                             = optional(string)
    global_mesh_enabled                     = optional(bool)
    peering_enforcement_enabled             = optional(bool)
    applies_to_group                        = list(object({
            group_connectivity  = string
            network_group_id    = string
            global_mesh_enabled = optional(bool)
            use_hub_gateway     = optional(bool)
        }))
    hub                                     = optional(list(object({
            resource_id   = string
            resource_type = string
        })))
  }))
}
