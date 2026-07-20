resource "aws_lex_bot_alias" "lex_bot_alias" {
  for_each = var.lex_bot_alias

  bot_name    = each.value.bot_name
  bot_version = each.value.bot_version
  name        = each.value.name
  description = each.value.description
  region      = each.value.region

  dynamic "conversation_logs" {
    for_each = each.value.conversation_logs != null ? each.value.conversation_logs : []
    content {
      iam_role_arn = conversation_logs.value.iam_role_arn

      dynamic "log_settings" {
        for_each = conversation_logs.value.log_settings != null ? conversation_logs.value.log_settings : []
        content {
          destination  = log_settings.value.destination
          log_type     = log_settings.value.log_type
          resource_arn = log_settings.value.resource_arn
          kms_key_arn  = log_settings.value.kms_key_arn
        }
      }
    }
  }
}
