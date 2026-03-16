resource "aws_key_pair" "key_pairs" {
  for_each = var.key_pairs

  public_key      = each.value.public_key
  key_name        = each.value.key_name
  key_name_prefix = each.value.key_name_prefix
  region          = each.value.region
  tags            = each.value.tags
  tags_all        = each.value.tags_all
}
