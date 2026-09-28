variable "container_registry_webhooks" {
  description = <<EOT
Map of container_registry_webhooks, attributes below
Required:
    - actions
    - location
    - name
    - registry_name
    - resource_group_name
    - service_uri
Optional:
    - custom_headers
    - scope
    - status
    - tags
EOT

  type = map(object({
    actions             = set(string)
    location            = string
    name                = string
    registry_name       = string
    resource_group_name = string
    service_uri         = string
    custom_headers      = optional(map(string))
    scope               = optional(string)
    status              = optional(string)
    tags                = optional(map(string))
  }))
}
