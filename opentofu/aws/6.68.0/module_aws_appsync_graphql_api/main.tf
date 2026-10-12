resource "aws_appsync_graphql_api" "appsync_graphql_apis" {
  for_each = var.appsync_graphql_apis

  authentication_type           = each.value.authentication_type
  name                          = each.value.name
  api_type                      = each.value.api_type
  introspection_config          = each.value.introspection_config
  merged_api_execution_role_arn = each.value.merged_api_execution_role_arn
  query_depth_limit             = each.value.query_depth_limit
  region                        = each.value.region
  resolver_count_limit          = each.value.resolver_count_limit
  schema                        = each.value.schema
  tags                          = each.value.tags
  tags_all                      = each.value.tags_all
  visibility                    = each.value.visibility
  xray_enabled                  = each.value.xray_enabled

  dynamic "additional_authentication_provider" {
    for_each = each.value.additional_authentication_provider != null ? each.value.additional_authentication_provider : []
    content {
      authentication_type = additional_authentication_provider.value.authentication_type

      dynamic "lambda_authorizer_config" {
        for_each = additional_authentication_provider.value.lambda_authorizer_config != null ? additional_authentication_provider.value.lambda_authorizer_config : []
        content {
          authorizer_uri                   = lambda_authorizer_config.value.authorizer_uri
          authorizer_result_ttl_in_seconds = lambda_authorizer_config.value.authorizer_result_ttl_in_seconds
          identity_validation_expression   = lambda_authorizer_config.value.identity_validation_expression
        }
      }

      dynamic "openid_connect_config" {
        for_each = additional_authentication_provider.value.openid_connect_config != null ? additional_authentication_provider.value.openid_connect_config : []
        content {
          issuer    = openid_connect_config.value.issuer
          auth_ttl  = openid_connect_config.value.auth_ttl
          client_id = openid_connect_config.value.client_id
          iat_ttl   = openid_connect_config.value.iat_ttl
        }
      }

      dynamic "user_pool_config" {
        for_each = additional_authentication_provider.value.user_pool_config != null ? additional_authentication_provider.value.user_pool_config : []
        content {
          user_pool_id        = user_pool_config.value.user_pool_id
          app_id_client_regex = user_pool_config.value.app_id_client_regex
          aws_region          = user_pool_config.value.aws_region
        }
      }
    }
  }

  dynamic "enhanced_metrics_config" {
    for_each = each.value.enhanced_metrics_config != null ? each.value.enhanced_metrics_config : []
    content {
      data_source_level_metrics_behavior = enhanced_metrics_config.value.data_source_level_metrics_behavior
      operation_level_metrics_config     = enhanced_metrics_config.value.operation_level_metrics_config
      resolver_level_metrics_behavior    = enhanced_metrics_config.value.resolver_level_metrics_behavior
    }
  }

  dynamic "lambda_authorizer_config" {
    for_each = each.value.lambda_authorizer_config != null ? each.value.lambda_authorizer_config : []
    content {
      authorizer_uri                   = lambda_authorizer_config.value.authorizer_uri
      authorizer_result_ttl_in_seconds = lambda_authorizer_config.value.authorizer_result_ttl_in_seconds
      identity_validation_expression   = lambda_authorizer_config.value.identity_validation_expression
    }
  }

  dynamic "log_config" {
    for_each = each.value.log_config != null ? each.value.log_config : []
    content {
      cloudwatch_logs_role_arn = log_config.value.cloudwatch_logs_role_arn
      field_log_level          = log_config.value.field_log_level
      exclude_verbose_content  = log_config.value.exclude_verbose_content
    }
  }

  dynamic "openid_connect_config" {
    for_each = each.value.openid_connect_config != null ? each.value.openid_connect_config : []
    content {
      issuer    = openid_connect_config.value.issuer
      auth_ttl  = openid_connect_config.value.auth_ttl
      client_id = openid_connect_config.value.client_id
      iat_ttl   = openid_connect_config.value.iat_ttl
    }
  }

  dynamic "user_pool_config" {
    for_each = each.value.user_pool_config != null ? each.value.user_pool_config : []
    content {
      default_action      = user_pool_config.value.default_action
      user_pool_id        = user_pool_config.value.user_pool_id
      app_id_client_regex = user_pool_config.value.app_id_client_regex
      aws_region          = user_pool_config.value.aws_region
    }
  }
}
