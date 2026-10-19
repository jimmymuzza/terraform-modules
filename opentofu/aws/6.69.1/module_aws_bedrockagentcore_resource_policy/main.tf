resource "aws_bedrockagentcore_resource_policy" "bedrockagentcore_resource_policies" {
  for_each = var.bedrockagentcore_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
