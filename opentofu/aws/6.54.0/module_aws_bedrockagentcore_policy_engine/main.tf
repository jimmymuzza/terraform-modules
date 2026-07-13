resource "aws_bedrockagentcore_policy_engine" "bedrockagentcore_policy_engines" {
  for_each = var.bedrockagentcore_policy_engines

  name               = each.value.name
  description        = each.value.description
  encryption_key_arn = each.value.encryption_key_arn
  region             = each.value.region
  tags               = each.value.tags
}
