variable "custom_providers" {
  description = <<EOT
Map of custom_providers, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - action
    - resource_type
    - validation
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    action              = optional(set(object({
            endpoint = string
            name     = string
        })))
    resource_type       = optional(set(object({
            endpoint     = string
            name         = string
            routing_type = optional(string)
        })))
    validation          = optional(set(object({
            specification = string
        })))
  }))
}
