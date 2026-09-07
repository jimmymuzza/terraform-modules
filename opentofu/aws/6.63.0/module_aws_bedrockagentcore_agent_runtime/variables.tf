variable "bedrockagentcore_agent_runtimes" {
  description = <<EOT
Map of bedrockagentcore_agent_runtimes, attributes below
Required:
    - agent_runtime_name
    - role_arn
Optional:
    - description
    - environment_variables
    - lifecycle_configuration
    - region
    - tags
    - agent_runtime_artifact
    - authorizer_configuration
    - filesystem_configuration
    - network_configuration
    - protocol_configuration
    - request_header_configuration
EOT

  type = map(object({
    agent_runtime_name           = string
    role_arn                     = string
    description                  = optional(string)
    environment_variables        = optional(map(string))
    lifecycle_configuration      = optional(list(object({
            idle_runtime_session_timeout = number
            max_lifetime = number
        })))
    region                       = optional(string)
    tags                         = optional(map(string))
    agent_runtime_artifact       = optional(list(object({
            code_configuration      = optional(list(object({
                entry_point = list(string)
                runtime     = string
                code        = optional(list(object({
                    s3 = optional(list(object({
                        bucket     = string
                        prefix     = string
                        version_id = optional(string)
                    })))
                })))
            })))
            container_configuration = optional(list(object({
                container_uri = string
            })))
        })))
    authorizer_configuration     = optional(list(object({
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
    filesystem_configuration     = optional(list(object({
            efs_access_point      = optional(list(object({
                access_point_arn = string
                mount_path       = string
            })))
            s3_files_access_point = optional(list(object({
                access_point_arn = string
                mount_path       = string
            })))
            session_storage       = optional(list(object({
                mount_path = string
            })))
        })))
    network_configuration        = optional(list(object({
            network_mode        = string
            network_mode_config = optional(list(object({
                security_groups = set(string)
                subnets         = set(string)
            })))
        })))
    protocol_configuration       = optional(list(object({
            server_protocol = optional(string)
        })))
    request_header_configuration = optional(list(object({
            request_header_allowlist = optional(set(string))
        })))
  }))
}
