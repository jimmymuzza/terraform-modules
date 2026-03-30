resource "aws_appsync_channel_namespace" "appsync_channel_namespaces" {
  for_each = var.appsync_channel_namespaces

  api_id        = each.value.api_id
  name          = each.value.name
  code_handlers = each.value.code_handlers
  region        = each.value.region
  tags          = each.value.tags

  dynamic "handler_configs" {
    for_each = each.value.handler_configs != null ? each.value.handler_configs : []
    content {

      dynamic "on_publish" {
        for_each = handler_configs.value.on_publish != null ? handler_configs.value.on_publish : []
        content {
          behavior = on_publish.value.behavior

          dynamic "integration" {
            for_each = on_publish.value.integration != null ? on_publish.value.integration : []
            content {
              data_source_name = integration.value.data_source_name

              dynamic "lambda_config" {
                for_each = integration.value.lambda_config != null ? integration.value.lambda_config : []
                content {
                  invoke_type = lambda_config.value.invoke_type
                }
              }
            }
          }
        }
      }

      dynamic "on_subscribe" {
        for_each = handler_configs.value.on_subscribe != null ? handler_configs.value.on_subscribe : []
        content {
          behavior = on_subscribe.value.behavior

          dynamic "integration" {
            for_each = on_subscribe.value.integration != null ? on_subscribe.value.integration : []
            content {
              data_source_name = integration.value.data_source_name

              dynamic "lambda_config" {
                for_each = integration.value.lambda_config != null ? integration.value.lambda_config : []
                content {
                  invoke_type = lambda_config.value.invoke_type
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "publish_auth_mode" {
    for_each = each.value.publish_auth_mode != null ? each.value.publish_auth_mode : []
    content {
      auth_type = publish_auth_mode.value.auth_type
    }
  }

  dynamic "subscribe_auth_mode" {
    for_each = each.value.subscribe_auth_mode != null ? each.value.subscribe_auth_mode : []
    content {
      auth_type = subscribe_auth_mode.value.auth_type
    }
  }
}
