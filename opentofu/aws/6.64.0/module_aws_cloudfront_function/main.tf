resource "aws_cloudfront_function" "cloudfront_functions" {
  for_each = var.cloudfront_functions

  code                         = each.value.code
  name                         = each.value.name
  runtime                      = each.value.runtime
  comment                      = each.value.comment
  key_value_store_associations = each.value.key_value_store_associations
  publish                      = each.value.publish
  tags                         = each.value.tags
  tags_all                     = each.value.tags_all
}
