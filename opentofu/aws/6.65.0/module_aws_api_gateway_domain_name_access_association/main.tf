resource "aws_api_gateway_domain_name_access_association" "api_gateway_domain_name_access_associations" {
  for_each = var.api_gateway_domain_name_access_associations

  access_association_source      = each.value.access_association_source
  access_association_source_type = each.value.access_association_source_type
  domain_name_arn                = each.value.domain_name_arn
  region                         = each.value.region
  tags                           = each.value.tags
}
