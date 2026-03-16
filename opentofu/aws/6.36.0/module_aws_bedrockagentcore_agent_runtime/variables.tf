variable "bedrockagentcore_agent_runtimes" {
  description = <<EOT
Map of bedrockagentcore_agent_runtimes, attributes below
Required:
    - agent_runtime_name
    - role_arn
Optional:
    - description
    - environment_variables
    - lifecycle_configuration
    - region
    - tags
    - agent_runtime_artifact
    - authorizer_configuration
    - network_configuration
    - protocol_configuration
    - request_header_configuration
EOT

  type = map(object({
    agent_runtime_name           = string
    role_arn                     = string
    description                  = optional(string)
    environment_variables        = optional(map(string))
    lifecycle_configuration      = optional(list(object({
            idle_runtime_session_timeout = number
            max_lifetime = number
        })))
    region                       = optional(string)
    tags                         = optional(map(string))
    agent_runtime_artifact       = optional(list(object({
            code_configuration      = optional(list(object({
                entry_point = list(string)
                runtime     = string
                code        = optional(list(object({
                    s3 = optional(list(object({
                        bucket     = string
                        prefix     = string
                        version_id = optional(string)
                    })))
                })))
            })))
            container_configuration = optional(list(object({
                container_uri = string
            })))
        })))
    authorizer_configuration     = optional(list(object({
            custom_jwt_authorizer = optional(list(object({
                discovery_url    = string
                allowed_audience = optional(set(string))
                allowed_clients  = optional(set(string))
                allowed_scopes   = optional(set(string))
            })))
        })))
    network_configuration        = optional(list(object({
            network_mode        = string
            network_mode_config = optional(list(object({
                security_groups = set(string)
                subnets         = set(string)
            })))
        })))
    protocol_configuration       = optional(list(object({
            server_protocol = optional(string)
        })))
    request_header_configuration = optional(list(object({
            request_header_allowlist = optional(set(string))
        })))
  }))
}
