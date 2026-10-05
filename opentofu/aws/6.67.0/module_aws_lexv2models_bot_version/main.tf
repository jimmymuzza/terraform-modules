resource "aws_lexv2models_bot_version" "lexv2models_bot_versions" {
  for_each = var.lexv2models_bot_versions

  bot_id               = each.value.bot_id
  locale_specification = each.value.locale_specification
  bot_version          = each.value.bot_version
  description          = each.value.description
  region               = each.value.region
}
