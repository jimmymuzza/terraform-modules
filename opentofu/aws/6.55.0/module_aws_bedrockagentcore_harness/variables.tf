variable "bedrockagentcore_harnesses" {
  description = <<EOT
Map of bedrockagentcore_harnesses, attributes below
Required:
    - execution_role_arn
    - harness_name
Optional:
    - allowed_tools
    - environment
    - environment_variables
    - max_iterations
    - max_tokens
    - region
    - tags
    - timeout_seconds
    - truncation
    - authorizer_configuration
    - environment_artifact
    - memory
    - model
    - skill
    - system_prompt
    - tool
EOT

  type = map(object({
    execution_role_arn       = string
    harness_name             = string
    allowed_tools            = optional(list(string))
    environment              = optional(list(object({
            agentcore_runtime_environment = list(object({
                agent_runtime_arn = string
                agent_runtime_id = string
                agent_runtime_name = string
                filesystem_configuration = list(object({
                    efs_access_point = list(object({
                        access_point_arn = string
                        mount_path = string
                    }))
                    s3_files_access_point = list(object({
                        access_point_arn = string
                        mount_path = string
                    }))
                    session_storage = list(object({
                        mount_path = string
                    }))
                }))
                lifecycle_configuration = list(object({
                    idle_runtime_session_timeout = number
                    max_lifetime = number
                }))
                network_configuration = list(object({
                    network_mode = string
                    network_mode_config = list(object({
                        require_service_s3_endpoint = bool
                        security_groups = set(string)
                        subnets = set(string)
                    }))
                }))
            }))
        })))
    environment_variables    = optional(map(string))
    max_iterations           = optional(number)
    max_tokens               = optional(number)
    region                   = optional(string)
    tags                     = optional(map(string))
    timeout_seconds          = optional(number)
    truncation               = optional(list(object({
            config = list(object({
                sliding_window = list(object({
                    messages_count = number
                }))
                summarization = list(object({
                    preserve_recent_messages = number
                    summarization_system_prompt = string
                    summary_ratio = number
                }))
            }))
            strategy = string
        })))
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
    environment_artifact     = optional(list(object({
            container_configuration = optional(list(object({
                container_uri = string
            })))
        })))
    memory                   = optional(list(object({
            agentcore_memory_configuration = optional(list(object({
                arn              = string
                actor_id         = optional(string)
                messages_count   = optional(number)
                retrieval_config = optional(list(object({
                    map_block_key   = string
                    relevance_score = optional(number)
                    strategy_id     = optional(string)
                    top_k           = optional(number)
                })))
            })))
        })))
    model                    = optional(list(object({
            bedrock_model_config = optional(list(object({
                model_id    = string
                max_tokens  = optional(number)
                temperature = optional(number)
                top_p       = optional(number)
            })))
            gemini_model_config  = optional(list(object({
                api_key_arn = string
                model_id    = string
                max_tokens  = optional(number)
                temperature = optional(number)
                top_k       = optional(number)
                top_p       = optional(number)
            })))
            openai_model_config  = optional(list(object({
                api_key_arn = string
                model_id    = string
                max_tokens  = optional(number)
                temperature = optional(number)
                top_p       = optional(number)
            })))
        })))
    skill                    = optional(list(object({
            path = string
        })))
    system_prompt            = optional(list(object({
            text = string
        })))
    tool                     = optional(list(object({
            type   = string
            name   = optional(string)
            config = optional(list(object({
                agentcore_browser          = optional(list(object({
                    browser_arn = optional(string)
                })))
                agentcore_code_interpreter = optional(list(object({
                    code_interpreter_arn = optional(string)
                })))
                agentcore_gateway          = optional(list(object({
                    gateway_arn   = string
                    outbound_auth = optional(list(object({
                        aws_iam = optional(bool)
                        none    = optional(bool)
                        oauth   = optional(list(object({
                            provider_arn       = string
                            scopes             = list(string)
                            custom_parameters  = optional(map(string))
                            default_return_url = optional(string)
                            grant_type         = optional(string)
                        })))
                    })))
                })))
                inline_function            = optional(list(object({
                    description  = string
                    input_schema = string
                })))
                remote_mcp                 = optional(list(object({
                    url     = string
                    headers = optional(map(string))
                })))
            })))
        })))
  }))
}
