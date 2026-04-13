resource "aws_bedrockagentcore_agent_runtime" "bedrockagentcore_agent_runtimes" {
  for_each = var.bedrockagentcore_agent_runtimes

  agent_runtime_name      = each.value.agent_runtime_name
  role_arn                = each.value.role_arn
  description             = each.value.description
  environment_variables   = each.value.environment_variables
  lifecycle_configuration = each.value.lifecycle_configuration
  region                  = each.value.region
  tags                    = each.value.tags

  dynamic "agent_runtime_artifact" {
    for_each = each.value.agent_runtime_artifact != null ? each.value.agent_runtime_artifact : []
    content {

      dynamic "code_configuration" {
        for_each = agent_runtime_artifact.value.code_configuration != null ? agent_runtime_artifact.value.code_configuration : []
        content {
          entry_point = code_configuration.value.entry_point
          runtime     = code_configuration.value.runtime

          dynamic "code" {
            for_each = code_configuration.value.code != null ? code_configuration.value.code : []
            content {

              dynamic "s3" {
                for_each = code.value.s3 != null ? code.value.s3 : []
                content {
                  bucket     = s3.value.bucket
                  prefix     = s3.value.prefix
                  version_id = s3.value.version_id
                }
              }
            }
          }
        }
      }

      dynamic "container_configuration" {
        for_each = agent_runtime_artifact.value.container_configuration != null ? agent_runtime_artifact.value.container_configuration : []
        content {
          container_uri = container_configuration.value.container_uri
        }
      }
    }
  }

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

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? each.value.network_configuration : []
    content {
      network_mode = network_configuration.value.network_mode

      dynamic "network_mode_config" {
        for_each = network_configuration.value.network_mode_config != null ? network_configuration.value.network_mode_config : []
        content {
          security_groups = network_mode_config.value.security_groups
          subnets         = network_mode_config.value.subnets
        }
      }
    }
  }

  dynamic "protocol_configuration" {
    for_each = each.value.protocol_configuration != null ? each.value.protocol_configuration : []
    content {
      server_protocol = protocol_configuration.value.server_protocol
    }
  }

  dynamic "request_header_configuration" {
    for_each = each.value.request_header_configuration != null ? each.value.request_header_configuration : []
    content {
      request_header_allowlist = request_header_configuration.value.request_header_allowlist
    }
  }
}
