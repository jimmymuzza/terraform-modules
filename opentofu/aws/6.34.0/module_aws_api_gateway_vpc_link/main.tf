resource "aws_api_gateway_vpc_link" "api_gateway_vpc_links" {
  for_each = var.api_gateway_vpc_links

  name        = each.value.name
  target_arns = each.value.target_arns
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
