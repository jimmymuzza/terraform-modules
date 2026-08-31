variable "bedrockagent_flows" {
  description = <<EOT
Map of bedrockagent_flows, attributes below
Required:
    - execution_role_arn
    - name
Optional:
    - customer_encryption_key_arn
    - description
    - region
    - tags
    - definition
EOT

  type = map(object({
    execution_role_arn          = string
    name                        = string
    customer_encryption_key_arn = optional(string)
    description                 = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    definition                  = optional(list(object({
            connection = optional(list(object({
                name          = string
                source        = string
                target        = string
                type          = string
                configuration = optional(list(object({
                    conditional = optional(list(object({
                        condition = string
                    })))
                    data        = optional(list(object({
                        source_output = string
                        target_input  = string
                    })))
                })))
            })))
            node       = optional(list(object({
                name          = string
                type          = string
                configuration = optional(list(object({
                    agent           = optional(list(object({
                        agent_alias_arn = string
                    })))
                    collector       = optional(list(object({

                    })))
                    condition       = optional(list(object({
                        condition = optional(list(object({
                            name       = string
                            expression = optional(string)
                        })))
                    })))
                    inline_code     = optional(list(object({
                        code     = string
                        language = string
                    })))
                    input           = optional(list(object({

                    })))
                    iterator        = optional(list(object({

                    })))
                    knowledge_base  = optional(list(object({
                        knowledge_base_id       = string
                        model_id                = string
                        number_of_results       = optional(number)
                        guardrail_configuration = optional(list(object({
                            guardrail_identifier = string
                            guardrail_version    = string
                        })))
                        inference_configuration = optional(list(object({
                            text = optional(list(object({
                                max_tokens     = optional(number)
                                stop_sequences = optional(list(string))
                                temperature    = optional(number)
                                top_p          = optional(number)
                            })))
                        })))
                    })))
                    lambda_function = optional(list(object({
                        lambda_arn = string
                    })))
                    lex             = optional(list(object({
                        bot_alias_arn = string
                        locale_id     = string
                    })))
                    output          = optional(list(object({

                    })))
                    prompt          = optional(list(object({
                        guardrail_configuration = optional(list(object({
                            guardrail_identifier = string
                            guardrail_version    = string
                        })))
                        source_configuration    = optional(list(object({
                            inline   = optional(list(object({
                                model_id                        = string
                                template_type                   = string
                                additional_model_request_fields = optional(string)
                                inference_configuration         = optional(list(object({
                                    text = optional(list(object({
                                        max_tokens     = optional(number)
                                        stop_sequences = optional(list(string))
                                        temperature    = optional(number)
                                        top_p          = optional(number)
                                    })))
                                })))
                                template_configuration          = optional(list(object({
                                    chat = optional(list(object({
                                        input_variable     = optional(list(object({
                                            name = string
                                        })))
                                        message            = optional(list(object({
                                            role    = string
                                            content = optional(list(object({
                                                text        = optional(string)
                                                cache_point = optional(list(object({
                                                    type = string
                                                })))
                                            })))
                                        })))
                                        system             = optional(list(object({
                                            text        = optional(string)
                                            cache_point = optional(list(object({
                                                type = string
                                            })))
                                        })))
                                        tool_configuration = optional(list(object({
                                            tool        = optional(list(object({
                                                cache_point = optional(list(object({
                                                    type = string
                                                })))
                                                tool_spec   = optional(list(object({
                                                    name         = string
                                                    description  = optional(string)
                                                    input_schema = optional(list(object({
                                                        json = optional(string)
                                                    })))
                                                })))
                                            })))
                                            tool_choice = optional(list(object({
                                                any  = optional(list(object({

                                                })))
                                                auto = optional(list(object({

                                                })))
                                                tool = optional(list(object({
                                                    name = string
                                                })))
                                            })))
                                        })))
                                    })))
                                    text = optional(list(object({
                                        text           = string
                                        cache_point    = optional(list(object({
                                            type = string
                                        })))
                                        input_variable = optional(list(object({
                                            name = string
                                        })))
                                    })))
                                })))
                            })))
                            resource = optional(list(object({
                                prompt_arn = string
                            })))
                        })))
                    })))
                    retrieval       = optional(list(object({
                        service_configuration = optional(list(object({
                            s3 = optional(list(object({
                                bucket_name = string
                            })))
                        })))
                    })))
                    storage         = optional(list(object({
                        service_configuration = optional(list(object({
                            s3 = optional(list(object({
                                bucket_name = string
                            })))
                        })))
                    })))
                })))
                input         = optional(list(object({
                    expression = string
                    name       = string
                    type       = string
                    category   = optional(string)
                })))
                output        = optional(list(object({
                    name = string
                    type = string
                })))
            })))
        })))
  }))
}
