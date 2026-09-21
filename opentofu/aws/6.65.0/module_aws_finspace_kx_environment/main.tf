resource "aws_finspace_kx_environment" "finspace_kx_environments" {
  for_each = var.finspace_kx_environments

  kms_key_id  = each.value.kms_key_id
  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "custom_dns_configuration" {
    for_each = each.value.custom_dns_configuration != null ? each.value.custom_dns_configuration : []
    content {
      custom_dns_server_ip   = custom_dns_configuration.value.custom_dns_server_ip
      custom_dns_server_name = custom_dns_configuration.value.custom_dns_server_name
    }
  }

  dynamic "transit_gateway_configuration" {
    for_each = each.value.transit_gateway_configuration != null ? each.value.transit_gateway_configuration : []
    content {
      routable_cidr_space = transit_gateway_configuration.value.routable_cidr_space
      transit_gateway_id  = transit_gateway_configuration.value.transit_gateway_id

      dynamic "attachment_network_acl_configuration" {
        for_each = transit_gateway_configuration.value.attachment_network_acl_configuration != null ? transit_gateway_configuration.value.attachment_network_acl_configuration : []
        content {
          cidr_block  = attachment_network_acl_configuration.value.cidr_block
          protocol    = attachment_network_acl_configuration.value.protocol
          rule_action = attachment_network_acl_configuration.value.rule_action
          rule_number = attachment_network_acl_configuration.value.rule_number

          dynamic "icmp_type_code" {
            for_each = attachment_network_acl_configuration.value.icmp_type_code != null ? attachment_network_acl_configuration.value.icmp_type_code : []
            content {
              code = icmp_type_code.value.code
              type = icmp_type_code.value.type
            }
          }

          dynamic "port_range" {
            for_each = attachment_network_acl_configuration.value.port_range != null ? attachment_network_acl_configuration.value.port_range : []
            content {
              from = port_range.value.from
              to   = port_range.value.to
            }
          }
        }
      }
    }
  }
}
