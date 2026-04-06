resource "aws_chime_voice_connector_origination" "chime_voice_connector_originations" {
  for_each = var.chime_voice_connector_originations

  voice_connector_id = each.value.voice_connector_id
  disabled           = each.value.disabled
  region             = each.value.region

  dynamic "route" {
    for_each = each.value.route != null ? each.value.route : []
    content {
      host     = route.value.host
      priority = route.value.priority
      protocol = route.value.protocol
      weight   = route.value.weight
      port     = route.value.port
    }
  }
}
