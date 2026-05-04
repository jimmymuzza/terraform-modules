variable "container_registry_agent_pools" {
  description = <<EOT
Map of container_registry_agent_pools, attributes below
Required:
    - container_registry_name
    - location
    - name
    - resource_group_name
Optional:
    - instance_count
    - tags
    - tier
    - virtual_network_subnet_id
EOT

  type = map(object({
    container_registry_name   = string
    location                  = string
    name                      = string
    resource_group_name       = string
    instance_count            = optional(number)
    tags                      = optional(map(string))
    tier                      = optional(string)
    virtual_network_subnet_id = optional(string)
  }))
}
