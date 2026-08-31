variable "bedrockagentcore_memory_strategies" {
  description = <<EOT
Map of bedrockagentcore_memory_strategies, attributes below
Required:
    - memory_id
    - name
    - type
Optional:
    - description
    - memory_execution_role_arn
    - namespace_templates
    - namespaces
    - region
    - configuration
    - memory_record_schema
    - reflection_configuration
EOT

  type = map(object({
    memory_id                 = string
    name                      = string
    type                      = string
    description               = optional(string)
    memory_execution_role_arn = optional(string)
    namespace_templates       = optional(set(string))
    namespaces                = optional(set(string))
    region                    = optional(string)
    configuration             = optional(list(object({
            type                       = string
            consolidation              = optional(list(object({
                append_to_prompt = string
                model_id         = string
            })))
            extraction                 = optional(list(object({
                append_to_prompt = string
                model_id         = string
            })))
            reflection                 = optional(list(object({
                append_to_prompt    = string
                model_id            = string
                namespace_templates = set(string)
            })))
            self_managed_configuration = optional(list(object({
                historical_context_window_size = optional(number)
                invocation_configuration       = optional(list(object({
                    payload_delivery_bucket_name = string
                    topic_arn                    = string
                })))
                trigger_conditions             = optional(list(object({
                    message_based_trigger = optional(list(object({
                        message_count = number
                    })))
                    time_based_trigger    = optional(list(object({
                        idle_session_timeout = number
                    })))
                    token_based_trigger   = optional(list(object({
                        token_count = number
                    })))
                })))
            })))
        })))
    memory_record_schema      = optional(list(object({
            metadata_schema = optional(list(object({
                key               = string
                extraction_type   = optional(string)
                type              = optional(string)
                extraction_config = optional(list(object({
                    llm_extraction_config = optional(list(object({
                        definition                 = string
                        llm_extraction_instruction = optional(string)
                        validation                 = optional(list(object({
                            number_validation      = optional(list(object({
                                max_value = optional(number)
                                min_value = optional(number)
                            })))
                            string_list_validation = optional(list(object({
                                allowed_values = optional(list(string))
                                max_items      = optional(number)
                            })))
                            string_validation      = optional(list(object({
                                allowed_values = list(string)
                            })))
                        })))
                    })))
                })))
            })))
        })))
    reflection_configuration  = optional(list(object({
            namespace_templates = set(string)
        })))
  }))
}
