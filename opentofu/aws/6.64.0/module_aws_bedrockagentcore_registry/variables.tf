variable "bedrockagentcore_registries" {
  description = <<EOT
Map of bedrockagentcore_registries, attributes below
Required:
    - name
Optional:
    - approval_configuration
    - authorizer_type
    - description
    - region
    - authorizer_configuration
EOT

  type = map(object({
    name                     = string
    approval_configuration   = optional(list(object({
            auto_approval = bool
        })))
    authorizer_type          = optional(string)
    description              = optional(string)
    region                   = optional(string)
    authorizer_configuration = optional(list(object({
            custom_jwt_authorizer = optional(list(object({
                discovery_url                  = string
                allowed_audience               = optional(set(string))
                allowed_clients                = optional(set(string))
                allowed_scopes                 = optional(set(string))
                allowed_workload_configuration = optional(list(object({
                    workload_identities = optional(list(string))
                    hosting_environment = optional(list(object({
                        arn = string
                    })))
                })))
                custom_claim                   = optional(set(object({
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
                private_endpoint               = optional(list(object({
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
                private_endpoint_overrides     = optional(list(object({
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
  }))
}
