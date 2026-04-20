variable "virtual_hub_security_partner_providers" {
  description = <<EOT
Map of virtual_hub_security_partner_providers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - security_provider_name
Optional:
    - tags
    - virtual_hub_id
EOT

  type = map(object({
    location               = string
    name                   = string
    resource_group_name    = string
    security_provider_name = string
    tags                   = optional(map(string))
    virtual_hub_id         = optional(string)
  }))
}
