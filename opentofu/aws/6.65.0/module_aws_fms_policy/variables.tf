variable "fms_policies" {
  description = <<EOT
Map of fms_policies, attributes below
Required:
    - exclude_resource_tags
    - name
    - security_service_policy_data
Optional:
    - delete_all_policy_resources
    - delete_unused_fm_managed_resources
    - description
    - region
    - remediation_enabled
    - resource_set_ids
    - resource_tag_logical_operator
    - resource_tags
    - resource_type
    - resource_type_list
    - tags
    - tags_all
    - exclude_map
    - include_map
EOT

  type = map(object({
    exclude_resource_tags              = bool
    name                               = string
    delete_all_policy_resources        = optional(bool)
    delete_unused_fm_managed_resources = optional(bool)
    description                        = optional(string)
    region                             = optional(string)
    remediation_enabled                = optional(bool)
    resource_set_ids                   = optional(set(string))
    resource_tag_logical_operator      = optional(string)
    resource_tags                      = optional(map(string))
    resource_type                      = optional(string)
    resource_type_list                 = optional(set(string))
    tags                               = optional(map(string))
    tags_all                           = optional(map(string))
    exclude_map                        = optional(list(object({
            account = optional(set(string))
            orgunit = optional(set(string))
        })))
    include_map                        = optional(list(object({
            account = optional(set(string))
            orgunit = optional(set(string))
        })))
    security_service_policy_data       = list(object({
            type                 = string
            managed_service_data = optional(string)
            policy_option        = optional(list(object({
                network_acl_common_policy   = optional(list(object({
                    network_acl_entry_set = optional(list(object({
                        force_remediate_for_first_entries = bool
                        force_remediate_for_last_entries  = bool
                        first_entry                       = optional(set(object({
                            egress          = bool
                            protocol        = string
                            rule_action     = string
                            cidr_block      = optional(string)
                            ipv6_cidr_block = optional(string)
                            icmp_type_code  = optional(list(object({
                                code = optional(number)
                                type = optional(number)
                            })))
                            port_range      = optional(list(object({
                                from = optional(number)
                                to   = optional(number)
                            })))
                        })))
                        last_entry                        = optional(set(object({
                            egress          = bool
                            protocol        = string
                            rule_action     = string
                            cidr_block      = optional(string)
                            ipv6_cidr_block = optional(string)
                            icmp_type_code  = optional(list(object({
                                code = optional(number)
                                type = optional(number)
                            })))
                            port_range      = optional(list(object({
                                from = optional(number)
                                to   = optional(number)
                            })))
                        })))
                    })))
                })))
                network_firewall_policy     = optional(list(object({
                    firewall_deployment_model = optional(string)
                })))
                third_party_firewall_policy = optional(list(object({
                    firewall_deployment_model = optional(string)
                })))
            })))
        }))
  }))
}
