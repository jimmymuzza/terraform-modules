variable "bedrockagentcore_gateway_targets" {
  description = <<EOT
Map of bedrockagentcore_gateway_targets, attributes below
Required:
    - gateway_identifier
    - name
Optional:
    - description
    - region
    - credential_provider_configuration
    - metadata_configuration
    - private_endpoint
    - target_configuration
EOT

  type = map(object({
    gateway_identifier                = string
    name                              = string
    description                       = optional(string)
    region                            = optional(string)
    credential_provider_configuration = optional(list(object({
            api_key                = optional(list(object({
                provider_arn              = string
                credential_location       = optional(string)
                credential_parameter_name = optional(string)
                credential_prefix         = optional(string)
            })))
            caller_iam_credentials = optional(list(object({
                service = string
                region  = optional(string)
            })))
            gateway_iam_role       = optional(list(object({
                region  = optional(string)
                service = optional(string)
            })))
            jwt_passthrough        = optional(list(object({

            })))
            oauth                  = optional(list(object({
                provider_arn       = string
                scopes             = set(string)
                custom_parameters  = optional(map(string))
                default_return_url = optional(string)
                grant_type         = optional(string)
            })))
        })))
    metadata_configuration            = optional(list(object({
            allowed_query_parameters = optional(set(string))
            allowed_request_headers  = optional(set(string))
            allowed_response_headers = optional(set(string))
        })))
    private_endpoint                  = optional(list(object({
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
    target_configuration              = optional(list(object({
            http = optional(list(object({
                agentcore_runtime = optional(list(object({
                    arn       = string
                    qualifier = optional(string)
                })))
            })))
            mcp  = optional(list(object({
                api_gateway     = optional(list(object({
                    rest_api_id                    = string
                    stage                          = string
                    api_gateway_tool_configuration = optional(list(object({
                        tool_filter   = optional(set(object({
                            filter_path = string
                            methods     = set(string)
                        })))
                        tool_override = optional(set(object({
                            method      = string
                            name        = string
                            path        = string
                            description = optional(string)
                        })))
                    })))
                })))
                lambda          = optional(list(object({
                    lambda_arn  = string
                    tool_schema = optional(list(object({
                        inline_payload = optional(list(object({
                            description   = string
                            name          = string
                            input_schema  = optional(list(object({
                                type        = string
                                description = optional(string)
                                items       = optional(list(object({
                                    type        = string
                                    description = optional(string)
                                    items       = optional(list(object({
                                        type            = string
                                        description     = optional(string)
                                        items_json      = optional(string)
                                        properties_json = optional(string)
                                    })))
                                    property    = optional(set(object({
                                        name            = string
                                        type            = string
                                        description     = optional(string)
                                        items_json      = optional(string)
                                        properties_json = optional(string)
                                        required        = optional(bool)
                                    })))
                                })))
                                property    = optional(set(object({
                                    name        = string
                                    type        = string
                                    description = optional(string)
                                    required    = optional(bool)
                                    items       = optional(list(object({
                                        type        = string
                                        description = optional(string)
                                        items       = optional(list(object({
                                            type            = string
                                            description     = optional(string)
                                            items_json      = optional(string)
                                            properties_json = optional(string)
                                        })))
                                        property    = optional(set(object({
                                            name            = string
                                            type            = string
                                            description     = optional(string)
                                            items_json      = optional(string)
                                            properties_json = optional(string)
                                            required        = optional(bool)
                                        })))
                                    })))
                                    property    = optional(set(object({
                                        name            = string
                                        type            = string
                                        description     = optional(string)
                                        items_json      = optional(string)
                                        properties_json = optional(string)
                                        required        = optional(bool)
                                    })))
                                })))
                            })))
                            output_schema = optional(list(object({
                                type        = string
                                description = optional(string)
                                items       = optional(list(object({
                                    type        = string
                                    description = optional(string)
                                    items       = optional(list(object({
                                        type            = string
                                        description     = optional(string)
                                        items_json      = optional(string)
                                        properties_json = optional(string)
                                    })))
                                    property    = optional(set(object({
                                        name            = string
                                        type            = string
                                        description     = optional(string)
                                        items_json      = optional(string)
                                        properties_json = optional(string)
                                        required        = optional(bool)
                                    })))
                                })))
                                property    = optional(set(object({
                                    name        = string
                                    type        = string
                                    description = optional(string)
                                    required    = optional(bool)
                                    items       = optional(list(object({
                                        type        = string
                                        description = optional(string)
                                        items       = optional(list(object({
                                            type            = string
                                            description     = optional(string)
                                            items_json      = optional(string)
                                            properties_json = optional(string)
                                        })))
                                        property    = optional(set(object({
                                            name            = string
                                            type            = string
                                            description     = optional(string)
                                            items_json      = optional(string)
                                            properties_json = optional(string)
                                            required        = optional(bool)
                                        })))
                                    })))
                                    property    = optional(set(object({
                                        name            = string
                                        type            = string
                                        description     = optional(string)
                                        items_json      = optional(string)
                                        properties_json = optional(string)
                                        required        = optional(bool)
                                    })))
                                })))
                            })))
                        })))
                        s3             = optional(list(object({
                            bucket_owner_account_id = optional(string)
                            uri                     = optional(string)
                        })))
                    })))
                })))
                mcp_server      = optional(list(object({
                    endpoint          = string
                    listing_mode      = optional(string)
                    resource_priority = optional(number)
                    mcp_tool_schema   = optional(list(object({
                        inline_payload = optional(list(object({
                            payload = string
                        })))
                        s3             = optional(list(object({
                            uri                     = string
                            bucket_owner_account_id = optional(string)
                        })))
                    })))
                })))
                open_api_schema = optional(list(object({
                    inline_payload = optional(list(object({
                        payload = string
                    })))
                    s3             = optional(list(object({
                        bucket_owner_account_id = optional(string)
                        uri                     = optional(string)
                    })))
                })))
                smithy_model    = optional(list(object({
                    inline_payload = optional(list(object({
                        payload = string
                    })))
                    s3             = optional(list(object({
                        bucket_owner_account_id = optional(string)
                        uri                     = optional(string)
                    })))
                })))
            })))
        })))
  }))
}
