resource "aws_cloudfront_key_value_store" "cloudfront_key_value_stores" {
  for_each = var.cloudfront_key_value_stores

  name    = each.value.name
  comment = each.value.comment
}
