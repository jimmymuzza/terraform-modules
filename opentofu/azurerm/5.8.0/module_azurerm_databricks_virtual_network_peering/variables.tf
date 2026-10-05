variable "databricks_virtual_network_peerings" {
  description = <<EOT
Map of databricks_virtual_network_peerings, attributes below
Required:
    - name
    - remote_address_space_prefixes
    - remote_virtual_network_id
    - resource_group_name
    - workspace_id
Optional:
    - allow_forwarded_traffic
    - allow_gateway_transit
    - allow_virtual_network_access
    - use_remote_gateways
EOT

  type = map(object({
    name                          = string
    remote_address_space_prefixes = list(string)
    remote_virtual_network_id     = string
    resource_group_name           = string
    workspace_id                  = string
    allow_forwarded_traffic       = optional(bool)
    allow_gateway_transit         = optional(bool)
    allow_virtual_network_access  = optional(bool)
    use_remote_gateways           = optional(bool)
  }))
}
