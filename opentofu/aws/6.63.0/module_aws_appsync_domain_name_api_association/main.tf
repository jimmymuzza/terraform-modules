resource "aws_appsync_domain_name_api_association" "appsync_domain_name_api_associations" {
  for_each = var.appsync_domain_name_api_associations

  api_id      = each.value.api_id
  domain_name = each.value.domain_name
  region      = each.value.region
}
