variable "bot_connections" {
  description = <<EOT
Map of bot_connections, attributes below
Required:
    - bot_name
    - client_id
    - client_secret
    - location
    - name
    - resource_group_name
    - service_provider_name
Optional:
    - parameters
    - scopes
EOT

  type = map(object({
    bot_name              = string
    client_id             = string
    client_secret         = string
    location              = string
    name                  = string
    resource_group_name   = string
    service_provider_name = string
    parameters            = optional(map(string))
    scopes                = optional(string)
  }))
}
