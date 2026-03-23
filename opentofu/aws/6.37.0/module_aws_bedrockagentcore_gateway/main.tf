resource "aws_bedrockagentcore_gateway" "bedrockagentcore_gateways" {
  for_each = var.bedrockagentcore_gateways

  authorizer_type = each.value.authorizer_type
  name            = each.value.name
  protocol_type   = each.value.protocol_type
  role_arn        = each.value.role_arn
  description     = each.value.description
  exception_level = each.value.exception_level
  kms_key_arn     = each.value.kms_key_arn
  region          = each.value.region
  tags            = each.value.tags

  dynamic "authorizer_configuration" {
    for_each = each.value.authorizer_configuration != null ? each.value.authorizer_configuration : []
    content {

      dynamic "custom_jwt_authorizer" {
        for_each = authorizer_configuration.value.custom_jwt_authorizer != null ? authorizer_configuration.value.custom_jwt_authorizer : []
        content {
          discovery_url    = custom_jwt_authorizer.value.discovery_url
          allowed_audience = custom_jwt_authorizer.value.allowed_audience
          allowed_clients  = custom_jwt_authorizer.value.allowed_clients
          allowed_scopes   = custom_jwt_authorizer.value.allowed_scopes
        }
      }
    }
  }

  dynamic "interceptor_configuration" {
    for_each = each.value.interceptor_configuration != null ? each.value.interceptor_configuration : []
    content {
      interception_points = interceptor_configuration.value.interception_points

      dynamic "input_configuration" {
        for_each = interceptor_configuration.value.input_configuration != null ? interceptor_configuration.value.input_configuration : []
        content {
          pass_request_headers = input_configuration.value.pass_request_headers
        }
      }

      dynamic "interceptor" {
        for_each = interceptor_configuration.value.interceptor != null ? interceptor_configuration.value.interceptor : []
        content {

          dynamic "lambda" {
            for_each = interceptor.value.lambda != null ? interceptor.value.lambda : []
            content {
              arn = lambda.value.arn
            }
          }
        }
      }
    }
  }

  dynamic "protocol_configuration" {
    for_each = each.value.protocol_configuration != null ? each.value.protocol_configuration : []
    content {

      dynamic "mcp" {
        for_each = protocol_configuration.value.mcp != null ? protocol_configuration.value.mcp : []
        content {
          instructions       = mcp.value.instructions
          search_type        = mcp.value.search_type
          supported_versions = mcp.value.supported_versions
        }
      }
    }
  }
}
