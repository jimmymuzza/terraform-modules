resource "aws_cloudfront_origin_access_identity" "cloudfront_origin_access_identities" {
  for_each = var.cloudfront_origin_access_identities

  comment = each.value.comment
}
