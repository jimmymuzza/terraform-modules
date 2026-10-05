resource "aws_lightsail_key_pair" "lightsail_key_pairs" {
  for_each = var.lightsail_key_pairs

  name        = each.value.name
  name_prefix = each.value.name_prefix
  pgp_key     = each.value.pgp_key
  public_key  = each.value.public_key
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
