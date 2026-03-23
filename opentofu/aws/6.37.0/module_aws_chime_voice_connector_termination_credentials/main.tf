resource "aws_chime_voice_connector_termination_credentials" "chime_voice_connector_termination_credentials" {
  for_each = var.chime_voice_connector_termination_credentials

  voice_connector_id = each.value.voice_connector_id
  region             = each.value.region

  dynamic "credentials" {
    for_each = each.value.credentials != null ? each.value.credentials : []
    content {
      password = credentials.value.password
      username = credentials.value.username
    }
  }
}
