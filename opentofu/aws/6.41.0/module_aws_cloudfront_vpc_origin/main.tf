resource "aws_cloudfront_vpc_origin" "cloudfront_vpc_origins" {
  for_each = var.cloudfront_vpc_origins

  tags = each.value.tags

  dynamic "vpc_origin_endpoint_config" {
    for_each = each.value.vpc_origin_endpoint_config != null ? each.value.vpc_origin_endpoint_config : []
    content {
      arn                    = vpc_origin_endpoint_config.value.arn
      http_port              = vpc_origin_endpoint_config.value.http_port
      https_port             = vpc_origin_endpoint_config.value.https_port
      name                   = vpc_origin_endpoint_config.value.name
      origin_protocol_policy = vpc_origin_endpoint_config.value.origin_protocol_policy

      dynamic "origin_ssl_protocols" {
        for_each = vpc_origin_endpoint_config.value.origin_ssl_protocols != null ? vpc_origin_endpoint_config.value.origin_ssl_protocols : []
        content {
          items    = origin_ssl_protocols.value.items
          quantity = origin_ssl_protocols.value.quantity
        }
      }
    }
  }
}
