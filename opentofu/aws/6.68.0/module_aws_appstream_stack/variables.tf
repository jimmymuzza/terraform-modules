variable "appstream_stacks" {
  description = <<EOT
Map of appstream_stacks, attributes below
Required:
    - name
Optional:
    - description
    - display_name
    - embed_host_domains
    - feedback_url
    - redirect_url
    - region
    - tags
    - tags_all
    - access_endpoints
    - application_settings
    - storage_connectors
    - streaming_experience_settings
    - user_settings
EOT

  type = map(object({
    name                          = string
    description                   = optional(string)
    display_name                  = optional(string)
    embed_host_domains            = optional(set(string))
    feedback_url                  = optional(string)
    redirect_url                  = optional(string)
    region                        = optional(string)
    tags                          = optional(map(string))
    tags_all                      = optional(map(string))
    access_endpoints              = optional(set(object({
            endpoint_type = string
            vpce_id       = optional(string)
        })))
    application_settings          = optional(list(object({
            enabled        = bool
            settings_group = optional(string)
        })))
    storage_connectors            = optional(set(object({
            connector_type      = string
            domains             = optional(list(string))
            resource_identifier = optional(string)
        })))
    streaming_experience_settings = optional(list(object({
            preferred_protocol = optional(string)
        })))
    user_settings                 = optional(set(object({
            action     = string
            permission = string
        })))
  }))
}
