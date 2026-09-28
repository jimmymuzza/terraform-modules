variable "agentregistry_registries" {
  description = <<EOT
Map of agentregistry_registries, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - approval_configuration
    - auto_detection_configuration
    - discovery_configuration
    - encryption_configuration
EOT

  type = map(object({
    name                         = string
    description                  = optional(string)
    region                       = optional(string)
    tags                         = optional(map(string))
    approval_configuration       = optional(list(object({
            auto_approval_rules = optional(set(string))
        })))
    auto_detection_configuration = optional(list(object({
            enabled = bool
            scope   = string
        })))
    discovery_configuration      = optional(list(object({
            authorizer_type          = string
            authorizer_configuration = optional(list(object({
                custom_jwt_authorizer = optional(list(object({
                    discovery_url             = string
                    allowed_audience          = optional(list(string))
                    allowed_clients           = optional(list(string))
                    allowed_scopes            = optional(list(string))
                    custom_claim              = optional(set(object({
                        inbound_token_claim_name       = string
                        inbound_token_claim_value_type = string
                        authorizing_claim_match_value  = optional(list(object({
                            claim_match_operator = string
                            claim_match_value    = optional(list(object({
                                match_value_string      = optional(string)
                                match_value_string_list = optional(set(string))
                            })))
                        })))
                    })))
                    private_endpoint          = optional(list(object({
                        managed_vpc_resource          = optional(list(object({
                            endpoint_ip_address_type = string
                            subnet_ids               = set(string)
                            vpc_identifier           = string
                            routing_domain           = optional(string)
                            security_group_ids       = optional(set(string))
                            tags                     = optional(map(string))
                        })))
                        self_managed_lattice_resource = optional(list(object({
                            resource_configuration_identifier = optional(string)
                        })))
                    })))
                    private_endpoint_override = optional(list(object({
                        domain           = string
                        private_endpoint = optional(list(object({
                            managed_vpc_resource          = optional(list(object({
                                endpoint_ip_address_type = string
                                subnet_ids               = set(string)
                                vpc_identifier           = string
                                routing_domain           = optional(string)
                                security_group_ids       = optional(set(string))
                                tags                     = optional(map(string))
                            })))
                            self_managed_lattice_resource = optional(list(object({
                                resource_configuration_identifier = optional(string)
                            })))
                        })))
                    })))
                })))
            })))
        })))
    encryption_configuration     = optional(list(object({
            kms_key_arn = string
        })))
  }))
}
