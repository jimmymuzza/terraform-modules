resource "aws_agentregistry_registry" "agentregistry_registries" {
  for_each = var.agentregistry_registries

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags

  dynamic "approval_configuration" {
    for_each = each.value.approval_configuration != null ? each.value.approval_configuration : []
    content {
      auto_approval_rules = approval_configuration.value.auto_approval_rules
    }
  }

  dynamic "discovery_configuration" {
    for_each = each.value.discovery_configuration != null ? each.value.discovery_configuration : []
    content {
      authorizer_type = discovery_configuration.value.authorizer_type

      dynamic "authorizer_configuration" {
        for_each = discovery_configuration.value.authorizer_configuration != null ? discovery_configuration.value.authorizer_configuration : []
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
    }
  }
}
