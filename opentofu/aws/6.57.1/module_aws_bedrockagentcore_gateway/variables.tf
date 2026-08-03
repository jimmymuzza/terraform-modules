variable "bedrockagentcore_gateways" {
  description = <<EOT
Map of bedrockagentcore_gateways, attributes below
Required:
    - authorizer_type
    - name
    - role_arn
Optional:
    - description
    - exception_level
    - kms_key_arn
    - protocol_type
    - region
    - tags
    - authorizer_configuration
    - interceptor_configuration
    - policy_engine_configuration
    - protocol_configuration
EOT

  type = map(object({
    authorizer_type             = string
    name                        = string
    role_arn                    = string
    description                 = optional(string)
    exception_level             = optional(string)
    kms_key_arn                 = optional(string)
    protocol_type               = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    authorizer_configuration    = optional(list(object({
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
                        resource_configuration_identifier = string
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
                            resource_configuration_identifier = string
                        })))
                    })))
                })))
            })))
        })))
    interceptor_configuration   = optional(list(object({
            interception_points = set(string)
            input_configuration = optional(list(object({
                pass_request_headers = bool
            })))
            interceptor         = optional(list(object({
                lambda = optional(list(object({
                    arn = string
                })))
            })))
        })))
    policy_engine_configuration = optional(list(object({
            arn  = string
            mode = string
        })))
    protocol_configuration      = optional(list(object({
            mcp = optional(list(object({
                instructions            = optional(string)
                search_type             = optional(string)
                supported_versions      = optional(set(string))
                session_configuration   = optional(list(object({
                    session_timeout_in_seconds = optional(number)
                })))
                streaming_configuration = optional(list(object({
                    enable_response_streaming = optional(bool)
                })))
            })))
        })))
  }))
}
