resource "aws_chime_voice_connector_streaming" "chime_voice_connector_streamings" {
  for_each = var.chime_voice_connector_streamings

  data_retention                 = each.value.data_retention
  voice_connector_id             = each.value.voice_connector_id
  disabled                       = each.value.disabled
  region                         = each.value.region
  streaming_notification_targets = each.value.streaming_notification_targets

  dynamic "media_insights_configuration" {
    for_each = each.value.media_insights_configuration != null ? each.value.media_insights_configuration : []
    content {
      configuration_arn = media_insights_configuration.value.configuration_arn
      disabled          = media_insights_configuration.value.disabled
    }
  }
}
