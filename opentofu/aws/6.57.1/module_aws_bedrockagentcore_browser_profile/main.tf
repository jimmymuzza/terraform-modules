resource "aws_bedrockagentcore_browser_profile" "bedrockagentcore_browser_profiles" {
  for_each = var.bedrockagentcore_browser_profiles

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
}
