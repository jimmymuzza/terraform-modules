resource "aws_lexv2models_bot_locale" "lexv2models_bot_locales" {
  for_each = var.lexv2models_bot_locales

  bot_id                           = each.value.bot_id
  bot_version                      = each.value.bot_version
  locale_id                        = each.value.locale_id
  n_lu_intent_confidence_threshold = each.value.n_lu_intent_confidence_threshold
  description                      = each.value.description
  name                             = each.value.name
  region                           = each.value.region

  dynamic "voice_settings" {
    for_each = each.value.voice_settings != null ? each.value.voice_settings : []
    content {
      voice_id = voice_settings.value.voice_id
      engine   = voice_settings.value.engine
    }
  }
}
