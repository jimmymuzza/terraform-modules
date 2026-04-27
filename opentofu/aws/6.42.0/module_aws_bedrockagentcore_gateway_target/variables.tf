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
    - target_configuration
EOT

  type = map(object({
    gateway_identifier                = string
    name                              = string
    description                       = optional(string)
    region                            = optional(string)
    credential_provider_configuration = optional(list(object({
            api_key          = optional(list(object({
                provider_arn              = string
                credential_location       = optional(string)
                credential_parameter_name = optional(string)
                credential_prefix         = optional(string)
            })))
            gateway_iam_role = optional(list(object({

            })))
            oauth            = optional(list(object({
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
    target_configuration              = optional(list(object({
            mcp = optional(list(object({
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
                    endpoint = string
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
