variable "synapse_private_link_hubs" {
  description = <<EOT
Map of synapse_private_link_hubs, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
  }))
}
