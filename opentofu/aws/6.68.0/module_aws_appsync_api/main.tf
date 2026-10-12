resource "aws_appsync_api" "appsync_apis" {
  for_each = var.appsync_apis

  name          = each.value.name
  owner_contact = each.value.owner_contact
  region        = each.value.region
  tags          = each.value.tags

  dynamic "event_config" {
    for_each = each.value.event_config != null ? each.value.event_config : []
    content {

      dynamic "auth_provider" {
        for_each = event_config.value.auth_provider != null ? event_config.value.auth_provider : []
        content {
          auth_type = auth_provider.value.auth_type

          dynamic "cognito_config" {
            for_each = auth_provider.value.cognito_config != null ? auth_provider.value.cognito_config : []
            content {
              aws_region          = cognito_config.value.aws_region
              user_pool_id        = cognito_config.value.user_pool_id
              app_id_client_regex = cognito_config.value.app_id_client_regex
            }
          }

          dynamic "lambda_authorizer_config" {
            for_each = auth_provider.value.lambda_authorizer_config != null ? auth_provider.value.lambda_authorizer_config : []
            content {
              authorizer_uri                   = lambda_authorizer_config.value.authorizer_uri
              authorizer_result_ttl_in_seconds = lambda_authorizer_config.value.authorizer_result_ttl_in_seconds
              identity_validation_expression   = lambda_authorizer_config.value.identity_validation_expression
            }
          }

          dynamic "openid_connect_config" {
            for_each = auth_provider.value.openid_connect_config != null ? auth_provider.value.openid_connect_config : []
            content {
              issuer    = openid_connect_config.value.issuer
              auth_ttl  = openid_connect_config.value.auth_ttl
              client_id = openid_connect_config.value.client_id
              iat_ttl   = openid_connect_config.value.iat_ttl
            }
          }
        }
      }

      dynamic "connection_auth_mode" {
        for_each = event_config.value.connection_auth_mode != null ? event_config.value.connection_auth_mode : []
        content {
          auth_type = connection_auth_mode.value.auth_type
        }
      }

      dynamic "default_publish_auth_mode" {
        for_each = event_config.value.default_publish_auth_mode != null ? event_config.value.default_publish_auth_mode : []
        content {
          auth_type = default_publish_auth_mode.value.auth_type
        }
      }

      dynamic "default_subscribe_auth_mode" {
        for_each = event_config.value.default_subscribe_auth_mode != null ? event_config.value.default_subscribe_auth_mode : []
        content {
          auth_type = default_subscribe_auth_mode.value.auth_type
        }
      }

      dynamic "log_config" {
        for_each = event_config.value.log_config != null ? event_config.value.log_config : []
        content {
          cloudwatch_logs_role_arn = log_config.value.cloudwatch_logs_role_arn
          log_level                = log_config.value.log_level
        }
      }
    }
  }
}
