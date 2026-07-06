resource "aws_bedrockagentcore_gateway" "bedrockagentcore_gateways" {
  for_each = var.bedrockagentcore_gateways

  authorizer_type = each.value.authorizer_type
  name            = each.value.name
  role_arn        = each.value.role_arn
  description     = each.value.description
  exception_level = each.value.exception_level
  kms_key_arn     = each.value.kms_key_arn
  protocol_type   = each.value.protocol_type
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

          dynamic "custom_claim" {
            for_each = custom_jwt_authorizer.value.custom_claim != null ? custom_jwt_authorizer.value.custom_claim : []
            content {
              inbound_token_claim_name       = custom_claim.value.inbound_token_claim_name
              inbound_token_claim_value_type = custom_claim.value.inbound_token_claim_value_type

              dynamic "authorizing_claim_match_value" {
                for_each = custom_claim.value.authorizing_claim_match_value != null ? custom_claim.value.authorizing_claim_match_value : []
                content {
                  claim_match_operator = authorizing_claim_match_value.value.claim_match_operator

                  dynamic "claim_match_value" {
                    for_each = authorizing_claim_match_value.value.claim_match_value != null ? authorizing_claim_match_value.value.claim_match_value : []
                    content {
                      match_value_string      = claim_match_value.value.match_value_string
                      match_value_string_list = claim_match_value.value.match_value_string_list
                    }
                  }
                }
              }
            }
          }
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

  dynamic "policy_engine_configuration" {
    for_each = each.value.policy_engine_configuration != null ? each.value.policy_engine_configuration : []
    content {
      arn  = policy_engine_configuration.value.arn
      mode = policy_engine_configuration.value.mode
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

          dynamic "session_configuration" {
            for_each = mcp.value.session_configuration != null ? mcp.value.session_configuration : []
            content {
              session_timeout_in_seconds = session_configuration.value.session_timeout_in_seconds
            }
          }

          dynamic "streaming_configuration" {
            for_each = mcp.value.streaming_configuration != null ? mcp.value.streaming_configuration : []
            content {
              enable_response_streaming = streaming_configuration.value.enable_response_streaming
            }
          }
        }
      }
    }
  }
}
