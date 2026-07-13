resource "aws_cloudfront_origin_access_control" "cloudfront_origin_access_controls" {
  for_each = var.cloudfront_origin_access_controls

  name                              = each.value.name
  origin_access_control_origin_type = each.value.origin_access_control_origin_type
  signing_behavior                  = each.value.signing_behavior
  signing_protocol                  = each.value.signing_protocol
  description                       = each.value.description
}
