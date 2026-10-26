resource "aws_bedrock_enforced_guardrail_configuration" "bedrock_enforced_guardrail_configurations" {
  for_each = var.bedrock_enforced_guardrail_configurations

  guardrail_arn     = each.value.guardrail_arn
  guardrail_version = each.value.guardrail_version
  region            = each.value.region

  dynamic "model_enforcement" {
    for_each = each.value.model_enforcement != null ? each.value.model_enforcement : []
    content {
      excluded_models = model_enforcement.value.excluded_models
      included_models = model_enforcement.value.included_models
    }
  }

  dynamic "selective_content_guarding" {
    for_each = each.value.selective_content_guarding != null ? each.value.selective_content_guarding : []
    content {
      messages = selective_content_guarding.value.messages
      system   = selective_content_guarding.value.system
    }
  }
}
