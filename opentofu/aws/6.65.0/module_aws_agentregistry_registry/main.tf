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

  dynamic "auto_detection_configuration" {
    for_each = each.value.auto_detection_configuration != null ? each.value.auto_detection_configuration : []
    content {
      enabled = auto_detection_configuration.value.enabled
      scope   = auto_detection_configuration.value.scope
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

              dynamic "private_endpoint" {
                for_each = custom_jwt_authorizer.value.private_endpoint != null ? custom_jwt_authorizer.value.private_endpoint : []
                content {

                  dynamic "managed_vpc_resource" {
                    for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                    content {
                      endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                      subnet_ids               = managed_vpc_resource.value.subnet_ids
                      vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                      routing_domain           = managed_vpc_resource.value.routing_domain
                      security_group_ids       = managed_vpc_resource.value.security_group_ids
                      tags                     = managed_vpc_resource.value.tags
                    }
                  }

                  dynamic "self_managed_lattice_resource" {
                    for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                    content {
                      resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
                    }
                  }
                }
              }

              dynamic "private_endpoint_override" {
                for_each = custom_jwt_authorizer.value.private_endpoint_override != null ? custom_jwt_authorizer.value.private_endpoint_override : []
                content {
                  domain = private_endpoint_override.value.domain

                  dynamic "private_endpoint" {
                    for_each = private_endpoint_override.value.private_endpoint != null ? private_endpoint_override.value.private_endpoint : []
                    content {

                      dynamic "managed_vpc_resource" {
                        for_each = private_endpoint.value.managed_vpc_resource != null ? private_endpoint.value.managed_vpc_resource : []
                        content {
                          endpoint_ip_address_type = managed_vpc_resource.value.endpoint_ip_address_type
                          subnet_ids               = managed_vpc_resource.value.subnet_ids
                          vpc_identifier           = managed_vpc_resource.value.vpc_identifier
                          routing_domain           = managed_vpc_resource.value.routing_domain
                          security_group_ids       = managed_vpc_resource.value.security_group_ids
                          tags                     = managed_vpc_resource.value.tags
                        }
                      }

                      dynamic "self_managed_lattice_resource" {
                        for_each = private_endpoint.value.self_managed_lattice_resource != null ? private_endpoint.value.self_managed_lattice_resource : []
                        content {
                          resource_configuration_identifier = self_managed_lattice_resource.value.resource_configuration_identifier
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

  dynamic "encryption_configuration" {
    for_each = each.value.encryption_configuration != null ? each.value.encryption_configuration : []
    content {
      kms_key_arn = encryption_configuration.value.kms_key_arn
    }
  }
}
