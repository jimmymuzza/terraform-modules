resource "aws_chime_voice_connector_group" "chime_voice_connector_groups" {
  for_each = var.chime_voice_connector_groups

  name   = each.value.name
  region = each.value.region

  dynamic "connector" {
    for_each = each.value.connector != null ? each.value.connector : []
    content {
      priority           = connector.value.priority
      voice_connector_id = connector.value.voice_connector_id
    }
  }
}
