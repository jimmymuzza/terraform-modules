variable "network_managers" {
  description = <<EOT
Map of network_managers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scope
Optional:
    - description
    - scope_accesses
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    description         = optional(string)
    scope_accesses      = optional(list(string))
    tags                = optional(map(string))
    scope               = list(object({
            management_group_ids = optional(list(string))
            subscription_ids     = optional(list(string))
        }))
  }))
}
