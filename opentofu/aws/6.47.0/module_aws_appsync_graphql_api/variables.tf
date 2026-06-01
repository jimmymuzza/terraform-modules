variable "appsync_graphql_apis" {
  description = <<EOT
Map of appsync_graphql_apis, attributes below
Required:
    - authentication_type
    - name
Optional:
    - api_type
    - introspection_config
    - merged_api_execution_role_arn
    - query_depth_limit
    - region
    - resolver_count_limit
    - schema
    - tags
    - tags_all
    - visibility
    - xray_enabled
    - additional_authentication_provider
    - enhanced_metrics_config
    - lambda_authorizer_config
    - log_config
    - openid_connect_config
    - user_pool_config
EOT

  type = map(object({
    authentication_type                = string
    name                               = string
    api_type                           = optional(string)
    introspection_config               = optional(string)
    merged_api_execution_role_arn      = optional(string)
    query_depth_limit                  = optional(number)
    region                             = optional(string)
    resolver_count_limit               = optional(number)
    schema                             = optional(string)
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    visibility                         = optional(string)
    xray_enabled                       = optional(bool)
    additional_authentication_provider = optional(list(object({
            authentication_type      = string
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
            user_pool_config         = optional(list(object({
                user_pool_id        = string
                app_id_client_regex = optional(string)
                aws_region          = optional(string)
            })))
        })))
    enhanced_metrics_config            = optional(list(object({
            data_source_level_metrics_behavior = string
            operation_level_metrics_config     = string
            resolver_level_metrics_behavior    = string
        })))
    lambda_authorizer_config           = optional(list(object({
            authorizer_uri                   = string
            authorizer_result_ttl_in_seconds = optional(number)
            identity_validation_expression   = optional(string)
        })))
    log_config                         = optional(list(object({
            cloudwatch_logs_role_arn = string
            field_log_level          = string
            exclude_verbose_content  = optional(bool)
        })))
    openid_connect_config              = optional(list(object({
            issuer    = string
            auth_ttl  = optional(number)
            client_id = optional(string)
            iat_ttl   = optional(number)
        })))
    user_pool_config                   = optional(list(object({
            default_action      = string
            user_pool_id        = string
            app_id_client_regex = optional(string)
            aws_region          = optional(string)
        })))
  }))
}
