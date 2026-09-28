resource "aws_opensearch_vpc_endpoint" "opensearch_vpc_endpoints" {
  for_each = var.opensearch_vpc_endpoints

  domain_arn = each.value.domain_arn
  region     = each.value.region

  dynamic "vpc_options" {
    for_each = each.value.vpc_options != null ? each.value.vpc_options : []
    content {
      subnet_ids         = vpc_options.value.subnet_ids
      security_group_ids = vpc_options.value.security_group_ids
    }
  }
}
