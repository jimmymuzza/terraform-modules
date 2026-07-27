resource "aws_chime_voice_connector_logging" "chime_voice_connector_loggings" {
  for_each = var.chime_voice_connector_loggings

  voice_connector_id       = each.value.voice_connector_id
  enable_media_metric_logs = each.value.enable_media_metric_logs
  enable_sip_logs          = each.value.enable_sip_logs
  region                   = each.value.region
}
