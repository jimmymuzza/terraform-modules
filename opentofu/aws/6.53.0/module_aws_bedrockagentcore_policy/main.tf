resource "aws_bedrockagentcore_policy" "bedrockagentcore_policies" {
  for_each = var.bedrockagentcore_policies

  name             = each.value.name
  policy_engine_id = each.value.policy_engine_id
  description      = each.value.description
  region           = each.value.region
  validation_mode  = each.value.validation_mode

  dynamic "definition" {
    for_each = each.value.definition != null ? each.value.definition : []
    content {

      dynamic "cedar" {
        for_each = definition.value.cedar != null ? definition.value.cedar : []
        content {
          statement = cedar.value.statement
        }
      }
    }
  }
}
