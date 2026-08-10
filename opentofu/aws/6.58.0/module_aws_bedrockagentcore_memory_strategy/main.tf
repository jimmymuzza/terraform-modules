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
    }
  }

  dynamic "reflection_configuration" {
    for_each = each.value.reflection_configuration != null ? each.value.reflection_configuration : []
    content {
      namespace_templates = reflection_configuration.value.namespace_templates
    }
  }
}
