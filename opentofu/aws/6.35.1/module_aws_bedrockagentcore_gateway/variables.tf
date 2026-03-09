variable "bedrockagentcore_gateways" {
  description = <<EOT
Map of bedrockagentcore_gateways, attributes below
Required:
    - authorizer_type
    - name
    - protocol_type
    - role_arn
Optional:
    - description
    - exception_level
    - kms_key_arn
    - region
    - tags
    - authorizer_configuration
    - interceptor_configuration
    - protocol_configuration
EOT

  type = map(object({
    authorizer_type           = string
    name                      = string
    protocol_type             = string
    role_arn                  = string
    description               = optional(string)
    exception_level           = optional(string)
    kms_key_arn               = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    authorizer_configuration  = optional(list(object({
            custom_jwt_authorizer = optional(list(object({
                discovery_url    = string
                allowed_audience = optional(set(string))
                allowed_clients  = optional(set(string))
            })))
        })))
    interceptor_configuration = optional(list(object({
            interception_points = set(string)
            input_configuration = optional(list(object({
                pass_request_headers = bool
            })))
            interceptor         = optional(list(object({
                lambda = optional(list(object({
                    arn = string
                })))
            })))
        })))
    protocol_configuration    = optional(list(object({
            mcp = optional(list(object({
                instructions       = optional(string)
                search_type        = optional(string)
                supported_versions = optional(set(string))
            })))
        })))
  }))
}
