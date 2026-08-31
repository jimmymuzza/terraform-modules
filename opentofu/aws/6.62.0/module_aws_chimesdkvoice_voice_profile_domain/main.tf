resource "aws_chimesdkvoice_voice_profile_domain" "chimesdkvoice_voice_profile_domains" {
  for_each = var.chimesdkvoice_voice_profile_domains

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "server_side_encryption_configuration" {
    for_each = each.value.server_side_encryption_configuration != null ? each.value.server_side_encryption_configuration : []
    content {
      kms_key_arn = server_side_encryption_configuration.value.kms_key_arn
    }
  }
}
