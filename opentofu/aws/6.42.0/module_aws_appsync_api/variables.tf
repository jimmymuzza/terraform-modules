variable "appsync_apis" {
  description = <<EOT
Map of appsync_apis, attributes below
Required:
    - name
Optional:
    - owner_contact
    - region
    - tags
    - event_config
EOT

  type = map(object({
    name          = string
    owner_contact = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    event_config  = optional(list(object({
            auth_provider               = optional(list(object({
                auth_type                = string
                cognito_config           = optional(list(object({
                    aws_region          = string
                    user_pool_id        = string
                    app_id_client_regex = optional(string)
                })))
                lambda_authorizer_config = optional(list(object({
                    authorizer_uri                   = string
                    authorizer_result_ttl_in_seconds = optional(number)
                    identity_validation_expression   = optional(string)
                })))
                openid_connect_config    = optional(list(object({
                    issuer    = string
                    auth_ttl  = optional(number)
                    client_id = optional(string)
                    iat_ttl   = optional(number)
                })))
            })))
            connection_auth_mode        = optional(list(object({
                auth_type = string
            })))
            default_publish_auth_mode   = optional(list(object({
                auth_type = string
            })))
            default_subscribe_auth_mode = optional(list(object({
                auth_type = string
            })))
            log_config                  = optional(list(object({
                cloudwatch_logs_role_arn = string
                log_level                = string
            })))
        })))
  }))
}
