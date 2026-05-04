variable "network_ddos_protection_plans" {
  description = <<EOT
Map of network_ddos_protection_plans, attributes below
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
