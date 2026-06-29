resource "aws_devicefarm_network_profile" "devicefarm_network_profiles" {
  for_each = var.devicefarm_network_profiles

  name                    = each.value.name
  project_arn             = each.value.project_arn
  description             = each.value.description
  downlink_bandwidth_bits = each.value.downlink_bandwidth_bits
  downlink_delay_ms       = each.value.downlink_delay_ms
  downlink_jitter_ms      = each.value.downlink_jitter_ms
  downlink_loss_percent   = each.value.downlink_loss_percent
  region                  = each.value.region
  tags                    = each.value.tags
  tags_all                = each.value.tags_all
  type                    = each.value.type
  uplink_bandwidth_bits   = each.value.uplink_bandwidth_bits
  uplink_delay_ms         = each.value.uplink_delay_ms
  uplink_jitter_ms        = each.value.uplink_jitter_ms
  uplink_loss_percent     = each.value.uplink_loss_percent
}
