resource "aws_chimesdkvoice_global_settings" "chimesdkvoice_global_settings" {
  for_each = var.chimesdkvoice_global_settings


  dynamic "voice_connector" {
    for_each = each.value.voice_connector != null ? each.value.voice_connector : []
    content {
      cdr_bucket = voice_connector.value.cdr_bucket
    }
  }
}
