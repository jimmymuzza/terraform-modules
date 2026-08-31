resource "aws_bedrockagentcore_memory_strategy" "bedrockagentcore_memory_strategies" {
  for_each = var.bedrockagentcore_memory_strategies

  memory_id                 = each.value.memory_id
  name                      = each.value.name
  type                      = each.value.type
  description               = each.value.description
  memory_execution_role_arn = each.value.memory_execution_role_arn
  namespace_templates       = each.value.namespace_templates
  namespaces                = each.value.namespaces
  region                    = each.value.region

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {
      type = configuration.value.type

      dynamic "consolidation" {
        for_each = configuration.value.consolidation != null ? configuration.value.consolidation : []
        content {
          append_to_prompt = consolidation.value.append_to_prompt
          model_id         = consolidation.value.model_id
        }
      }

      dynamic "extraction" {
        for_each = configuration.value.extraction != null ? configuration.value.extraction : []
        content {
          append_to_prompt = extraction.value.append_to_prompt
          model_id         = extraction.value.model_id
        }
      }

      dynamic "reflection" {
        for_each = configuration.value.reflection != null ? configuration.value.reflection : []
        content {
          append_to_prompt    = reflection.value.append_to_prompt
          model_id            = reflection.value.model_id
          namespace_templates = reflection.value.namespace_templates
        }
      }

      dynamic "self_managed_configuration" {
        for_each = configuration.value.self_managed_configuration != null ? configuration.value.self_managed_configuration : []
        content {
          historical_context_window_size = self_managed_configuration.value.historical_context_window_size

          dynamic "invocation_configuration" {
            for_each = self_managed_configuration.value.invocation_configuration != null ? self_managed_configuration.value.invocation_configuration : []
            content {
              payload_delivery_bucket_name = invocation_configuration.value.payload_delivery_bucket_name
              topic_arn                    = invocation_configuration.value.topic_arn
            }
          }

          dynamic "trigger_conditions" {
            for_each = self_managed_configuration.value.trigger_conditions != null ? self_managed_configuration.value.trigger_conditions : []
            content {

              dynamic "message_based_trigger" {
                for_each = trigger_conditions.value.message_based_trigger != null ? trigger_conditions.value.message_based_trigger : []
                content {
                  message_count = message_based_trigger.value.message_count
                }
              }

              dynamic "time_based_trigger" {
                for_each = trigger_conditions.value.time_based_trigger != null ? trigger_conditions.value.time_based_trigger : []
                content {
                  idle_session_timeout = time_based_trigger.value.idle_session_timeout
                }
              }

              dynamic "token_based_trigger" {
                for_each = trigger_conditions.value.token_based_trigger != null ? trigger_conditions.value.token_based_trigger : []
                content {
                  token_count = token_based_trigger.value.token_count
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "memory_record_schema" {
    for_each = each.value.memory_record_schema != null ? each.value.memory_record_schema : []
    content {

      dynamic "metadata_schema" {
        for_each = memory_record_schema.value.metadata_schema != null ? memory_record_schema.value.metadata_schema : []
        content {
          key             = metadata_schema.value.key
          extraction_type = metadata_schema.value.extraction_type
          type            = metadata_schema.value.type

          dynamic "extraction_config" {
            for_each = metadata_schema.value.extraction_config != null ? metadata_schema.value.extraction_config : []
            content {

              dynamic "llm_extraction_config" {
                for_each = extraction_config.value.llm_extraction_config != null ? extraction_config.value.llm_extraction_config : []
                content {
                  definition                 = llm_extraction_config.value.definition
                  llm_extraction_instruction = llm_extraction_config.value.llm_extraction_instruction

                  dynamic "validation" {
                    for_each = llm_extraction_config.value.validation != null ? llm_extraction_config.value.validation : []
                    content {

                      dynamic "number_validation" {
                        for_each = validation.value.number_validation != null ? validation.value.number_validation : []
                        content {
                          max_value = number_validation.value.max_value
                          min_value = number_validation.value.min_value
                        }
                      }

                      dynamic "string_list_validation" {
                        for_each = validation.value.string_list_validation != null ? validation.value.string_list_validation : []
                        content {
                          allowed_values = string_list_validation.value.allowed_values
                          max_items      = string_list_validation.value.max_items
                        }
                      }

                      dynamic "string_validation" {
                        for_each = validation.value.string_validation != null ? validation.value.string_validation : []
                        content {
                          allowed_values = string_validation.value.allowed_values
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "reflection_configuration" {
    for_each = each.value.reflection_configuration != null ? each.value.reflection_configuration : []
    content {
      namespace_templates = reflection_configuration.value.namespace_templates
    }
  }
}
