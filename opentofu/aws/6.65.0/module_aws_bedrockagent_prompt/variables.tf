variable "bedrockagent_prompts" {
  description = <<EOT
Map of bedrockagent_prompts, attributes below
Required:
    - name
Optional:
    - customer_encryption_key_arn
    - default_variant
    - description
    - region
    - tags
    - variant
EOT

  type = map(object({
    name                        = string
    customer_encryption_key_arn = optional(string)
    default_variant             = optional(string)
    description                 = optional(string)
    region                      = optional(string)
    tags                        = optional(map(string))
    variant                     = optional(list(object({
            name                            = string
            template_type                   = string
            additional_model_request_fields = optional(string)
            model_id                        = optional(string)
            gen_ai_resource                 = optional(list(object({
                agent = optional(list(object({
                    agent_identifier = string
                })))
            })))
            inference_configuration         = optional(list(object({
                text = optional(list(object({
                    max_tokens     = optional(number)
                    stop_sequences = optional(list(string))
                    temperature    = optional(number)
                    top_p          = optional(number)
                })))
            })))
            metadata                        = optional(list(object({
                key   = string
                value = string
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
  }))
}
