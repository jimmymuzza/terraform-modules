resource "aws_cloudfront_key_group" "cloudfront_key_groups" {
  for_each = var.cloudfront_key_groups

  items   = each.value.items
  name    = each.value.name
  comment = each.value.comment
}
