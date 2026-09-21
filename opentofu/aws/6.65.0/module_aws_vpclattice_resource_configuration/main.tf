resource "aws_vpclattice_resource_configuration" "vpclattice_resource_configurations" {
  for_each = var.vpclattice_resource_configurations

  name                                           = each.value.name
  allow_association_to_shareable_service_network = each.value.allow_association_to_shareable_service_network
  custom_domain_name                             = each.value.custom_domain_name
  domain_verification_id                         = each.value.domain_verification_id
  port_ranges                                    = each.value.port_ranges
  protocol                                       = each.value.protocol
  region                                         = each.value.region
  resource_configuration_group_id                = each.value.resource_configuration_group_id
  resource_gateway_identifier                    = each.value.resource_gateway_identifier
  tags                                           = each.value.tags
  type                                           = each.value.type

  dynamic "resource_configuration_definition" {
    for_each = each.value.resource_configuration_definition != null ? each.value.resource_configuration_definition : []
    content {

      dynamic "arn_resource" {
        for_each = resource_configuration_definition.value.arn_resource != null ? resource_configuration_definition.value.arn_resource : []
        content {
          arn = arn_resource.value.arn
        }
      }

      dynamic "dns_resource" {
        for_each = resource_configuration_definition.value.dns_resource != null ? resource_configuration_definition.value.dns_resource : []
        content {
          domain_name     = dns_resource.value.domain_name
          ip_address_type = dns_resource.value.ip_address_type
        }
      }

      dynamic "ip_resource" {
        for_each = resource_configuration_definition.value.ip_resource != null ? resource_configuration_definition.value.ip_resource : []
        content {
          ip_address = ip_resource.value.ip_address
        }
      }
    }
  }
}
