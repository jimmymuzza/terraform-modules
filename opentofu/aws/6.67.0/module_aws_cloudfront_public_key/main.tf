resource "aws_cloudfront_public_key" "cloudfront_public_keys" {
  for_each = var.cloudfront_public_keys

  encoded_key = each.value.encoded_key
  comment     = each.value.comment
  name        = each.value.name
  name_prefix = each.value.name_prefix
}
