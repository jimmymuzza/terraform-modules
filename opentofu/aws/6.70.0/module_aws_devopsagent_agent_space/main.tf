resource "aws_devopsagent_agent_space" "devopsagent_agent_spaces" {
  for_each = var.devopsagent_agent_spaces

  name        = each.value.name
  description = each.value.description
  kms_key_arn = each.value.kms_key_arn
  locale      = each.value.locale
  region      = each.value.region
  tags        = each.value.tags
}
