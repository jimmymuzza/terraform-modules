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
                provider_arn      = string
                scopes            = set(string)
                custom_parameters = optional(map(string))
            })))
        })))
    target_configuration              = optional(list(object({
            mcp = optional(list(object({
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
