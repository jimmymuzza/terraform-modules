resource "aws_fms_policy" "fms_policies" {
  for_each = var.fms_policies

  exclude_resource_tags              = each.value.exclude_resource_tags
  name                               = each.value.name
  delete_all_policy_resources        = each.value.delete_all_policy_resources
  delete_unused_fm_managed_resources = each.value.delete_unused_fm_managed_resources
  description                        = each.value.description
  region                             = each.value.region
  remediation_enabled                = each.value.remediation_enabled
  resource_set_ids                   = each.value.resource_set_ids
  resource_tag_logical_operator      = each.value.resource_tag_logical_operator
  resource_tags                      = each.value.resource_tags
  resource_type                      = each.value.resource_type
  resource_type_list                 = each.value.resource_type_list
  tags                               = each.value.tags
  tags_all                           = each.value.tags_all

  dynamic "exclude_map" {
    for_each = each.value.exclude_map != null ? each.value.exclude_map : []
    content {
      account = exclude_map.value.account
      orgunit = exclude_map.value.orgunit
    }
  }

  dynamic "include_map" {
    for_each = each.value.include_map != null ? each.value.include_map : []
    content {
      account = include_map.value.account
      orgunit = include_map.value.orgunit
    }
  }

  dynamic "security_service_policy_data" {
    for_each = each.value.security_service_policy_data != null ? each.value.security_service_policy_data : []
    content {
      type                 = security_service_policy_data.value.type
      managed_service_data = security_service_policy_data.value.managed_service_data

      dynamic "policy_option" {
        for_each = security_service_policy_data.value.policy_option != null ? security_service_policy_data.value.policy_option : []
        content {

          dynamic "network_acl_common_policy" {
            for_each = policy_option.value.network_acl_common_policy != null ? policy_option.value.network_acl_common_policy : []
            content {

              dynamic "network_acl_entry_set" {
                for_each = network_acl_common_policy.value.network_acl_entry_set != null ? network_acl_common_policy.value.network_acl_entry_set : []
                content {
                  force_remediate_for_first_entries = network_acl_entry_set.value.force_remediate_for_first_entries
                  force_remediate_for_last_entries  = network_acl_entry_set.value.force_remediate_for_last_entries

                  dynamic "first_entry" {
                    for_each = network_acl_entry_set.value.first_entry != null ? network_acl_entry_set.value.first_entry : []
                    content {
                      egress          = first_entry.value.egress
                      protocol        = first_entry.value.protocol
                      rule_action     = first_entry.value.rule_action
                      cidr_block      = first_entry.value.cidr_block
                      ipv6_cidr_block = first_entry.value.ipv6_cidr_block

                      dynamic "icmp_type_code" {
                        for_each = first_entry.value.icmp_type_code != null ? first_entry.value.icmp_type_code : []
                        content {
                          code = icmp_type_code.value.code
                          type = icmp_type_code.value.type
                        }
                      }

                      dynamic "port_range" {
                        for_each = first_entry.value.port_range != null ? first_entry.value.port_range : []
                        content {
                          from = port_range.value.from
                          to   = port_range.value.to
                        }
                      }
                    }
                  }

                  dynamic "last_entry" {
                    for_each = network_acl_entry_set.value.last_entry != null ? network_acl_entry_set.value.last_entry : []
                    content {
                      egress          = last_entry.value.egress
                      protocol        = last_entry.value.protocol
                      rule_action     = last_entry.value.rule_action
                      cidr_block      = last_entry.value.cidr_block
                      ipv6_cidr_block = last_entry.value.ipv6_cidr_block

                      dynamic "icmp_type_code" {
                        for_each = last_entry.value.icmp_type_code != null ? last_entry.value.icmp_type_code : []
                        content {
                          code = icmp_type_code.value.code
                          type = icmp_type_code.value.type
                        }
                      }

                      dynamic "port_range" {
                        for_each = last_entry.value.port_range != null ? last_entry.value.port_range : []
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
          }

          dynamic "network_firewall_policy" {
            for_each = policy_option.value.network_firewall_policy != null ? policy_option.value.network_firewall_policy : []
            content {
              firewall_deployment_model = network_firewall_policy.value.firewall_deployment_model
            }
          }

          dynamic "third_party_firewall_policy" {
            for_each = policy_option.value.third_party_firewall_policy != null ? policy_option.value.third_party_firewall_policy : []
            content {
              firewall_deployment_model = third_party_firewall_policy.value.firewall_deployment_model
            }
          }
        }
      }
    }
  }
}
