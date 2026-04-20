resource "aws_ivs_playback_key_pair" "ivs_playback_key_pairs" {
  for_each = var.ivs_playback_key_pairs

  public_key = each.value.public_key
  name       = each.value.name
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all
}
