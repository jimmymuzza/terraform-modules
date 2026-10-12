resource "aws_chime_voice_connector" "chime_voice_connectors" {
  for_each = var.chime_voice_connectors

  name               = each.value.name
  require_encryption = each.value.require_encryption
  aws_region         = each.value.aws_region
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
