variable "appsync_channel_namespaces" {
  description = <<EOT
Map of appsync_channel_namespaces, attributes below
Required:
    - api_id
    - name
Optional:
    - code_handlers
    - region
    - tags
    - handler_configs
    - publish_auth_mode
    - subscribe_auth_mode
EOT

  type = map(object({
    api_id              = string
    name                = string
    code_handlers       = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    handler_configs     = optional(list(object({
            on_publish   = optional(list(object({
                behavior    = string
                integration = optional(list(object({
                    data_source_name = string
                    lambda_config    = optional(list(object({
                        invoke_type = optional(string)
                    })))
                })))
            })))
            on_subscribe = optional(list(object({
                behavior    = string
                integration = optional(list(object({
                    data_source_name = string
                    lambda_config    = optional(list(object({
                        invoke_type = optional(string)
                    })))
                })))
            })))
        })))
    publish_auth_mode   = optional(list(object({
            auth_type = string
        })))
    subscribe_auth_mode = optional(list(object({
            auth_type = string
        })))
  }))
}
