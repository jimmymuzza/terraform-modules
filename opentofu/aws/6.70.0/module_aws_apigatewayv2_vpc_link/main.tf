resource "aws_apigatewayv2_vpc_link" "apigatewayv2_vpc_links" {
  for_each = var.apigatewayv2_vpc_links

  name               = each.value.name
  security_group_ids = each.value.security_group_ids
  subnet_ids         = each.value.subnet_ids
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
