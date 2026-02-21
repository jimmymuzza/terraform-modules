variable "network_manager_connectivity_configurations" {
  description = <<EOT
Map of network_manager_connectivity_configurations, attributes below
Required:
    - connectivity_topology
    - name
    - network_manager_id
    - applies_to_group
Optional:
    - delete_existing_peering_enabled
    - description
    - global_mesh_enabled
    - hub
EOT

  type = map(object({
    connectivity_topology           = string
    name                            = string
    network_manager_id              = string
    delete_existing_peering_enabled = optional(bool)
    description                     = optional(string)
    global_mesh_enabled             = optional(bool)
    applies_to_group                = list(object({
            group_connectivity  = string
            network_group_id    = string
            global_mesh_enabled = optional(bool)
            use_hub_gateway     = optional(bool)
        }))
    hub                             = optional(list(object({
            resource_id   = string
            resource_type = string
        })))
  }))
}
