resource "aws_bedrockagentcore_memory_strategy" "bedrockagentcore_memory_strategies" {
  for_each = var.bedrockagentcore_memory_strategies

  memory_id                 = each.value.memory_id
  name                      = each.value.name
  namespaces                = each.value.namespaces
  type                      = each.value.type
  description               = each.value.description
  memory_execution_role_arn = each.value.memory_execution_role_arn
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
    }
  }
}
