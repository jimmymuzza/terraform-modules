variable "fabric_capacities" {
  description = <<EOT
Map of fabric_capacities, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - administration_members
    - tags
EOT

  type = map(object({
    location               = string
    name                   = string
    resource_group_name    = string
    administration_members = optional(set(string))
    tags                   = optional(map(string))
    sku                    = list(object({
            name = string
            tier = string
        }))
  }))
}
