resource "aws_bedrockagentcore_registry" "bedrockagentcore_registries" {
  for_each = var.bedrockagentcore_registries

  name                   = each.value.name
  approval_configuration = each.value.approval_configuration
  authorizer_type        = each.value.authorizer_type
  description            = each.value.description
  region                 = each.value.region

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

          dynamic "allowed_workload_configuration" {
            for_each = custom_jwt_authorizer.value.allowed_workload_configuration != null ? custom_jwt_authorizer.value.allowed_workload_configuration : []
            content {
              workload_identities = allowed_workload_configuration.value.workload_identities

              dynamic "hosting_environment" {
                for_each = allowed_workload_configuration.value.hosting_environment != null ? allowed_workload_configuration.value.hosting_environment : []
                content {
                  arn = hosting_environment.value.arn
                }
              }
            }
          }

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

          dynamic "private_endpoint_overrides" {
            for_each = custom_jwt_authorizer.value.private_endpoint_overrides != null ? custom_jwt_authorizer.value.private_endpoint_overrides : []
            content {
              domain = private_endpoint_overrides.value.domain

              dynamic "private_endpoint" {
                for_each = private_endpoint_overrides.value.private_endpoint != null ? private_endpoint_overrides.value.private_endpoint : []
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
