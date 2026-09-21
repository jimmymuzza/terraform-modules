variable "cloudwatch_event_connections" {
  description = <<EOT
Map of cloudwatch_event_connections, attributes below
Required:
    - authorization_type
    - name
    - auth_parameters
Optional:
    - description
    - kms_key_identifier
    - region
    - invocation_connectivity_parameters
EOT

  type = map(object({
    authorization_type                 = string
    name                               = string
    description                        = optional(string)
    kms_key_identifier                 = optional(string)
    region                             = optional(string)
    auth_parameters                    = list(object({
            api_key                    = optional(list(object({
                key   = string
                value = string
            })))
            basic                      = optional(list(object({
                password = string
                username = string
            })))
            connectivity_parameters    = optional(list(object({
                resource_parameters = list(object({
                    resource_configuration_arn = string
                }))
            })))
            invocation_http_parameters = optional(list(object({
                body         = optional(list(object({
                    is_value_secret = optional(bool)
                    key             = optional(string)
                    value           = optional(string)
                })))
                header       = optional(list(object({
                    is_value_secret = optional(bool)
                    key             = optional(string)
                    value           = optional(string)
                })))
                query_string = optional(list(object({
                    is_value_secret = optional(bool)
                    key             = optional(string)
                    value           = optional(string)
                })))
            })))
            oauth                      = optional(list(object({
                authorization_endpoint = string
                http_method            = string
                client_parameters      = optional(list(object({
                    client_id     = string
                    client_secret = string
                })))
                oauth_http_parameters  = list(object({
                    body         = optional(list(object({
                        is_value_secret = optional(bool)
                        key             = optional(string)
                        value           = optional(string)
                    })))
                    header       = optional(list(object({
                        is_value_secret = optional(bool)
                        key             = optional(string)
                        value           = optional(string)
                    })))
                    query_string = optional(list(object({
                        is_value_secret = optional(bool)
                        key             = optional(string)
                        value           = optional(string)
                    })))
                }))
            })))
        }))
    invocation_connectivity_parameters = optional(list(object({
            resource_parameters = list(object({
                resource_configuration_arn = string
            }))
        })))
  }))
}
