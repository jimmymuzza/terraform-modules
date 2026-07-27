resource "aws_media_package_channel" "media_package_channels" {
  for_each = var.media_package_channels

  channel_id  = each.value.channel_id
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
