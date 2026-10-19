resource "aws_media_packagev2_channel_group" "media_packagev2_channel_groups" {
  for_each = var.media_packagev2_channel_groups

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
}
