variable "arc_resource_bridge_appliances" {
  description = <<EOT
Map of arc_resource_bridge_appliances, attributes below
Required:
    - distro
    - infrastructure_provider
    - location
    - name
    - resource_group_name
    - identity
Optional:
    - public_key_base64
    - tags
EOT

  type = map(object({
    distro                  = string
    infrastructure_provider = string
    location                = string
    name                    = string
    resource_group_name     = string
    public_key_base64       = optional(string)
    tags                    = optional(map(string))
    identity                = list(object({
            type = string
        }))
  }))
}
