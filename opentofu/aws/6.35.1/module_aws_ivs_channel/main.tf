resource "aws_ivs_channel" "ivs_channels" {
  for_each = var.ivs_channels

  authorized                  = each.value.authorized
  latency_mode                = each.value.latency_mode
  name                        = each.value.name
  recording_configuration_arn = each.value.recording_configuration_arn
  region                      = each.value.region
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
  type                        = each.value.type
}
