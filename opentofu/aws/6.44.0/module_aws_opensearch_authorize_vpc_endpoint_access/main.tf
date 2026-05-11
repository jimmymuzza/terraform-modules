resource "aws_opensearch_authorize_vpc_endpoint_access" "opensearch_authorize_vpc_endpoint_accesses" {
  for_each = var.opensearch_authorize_vpc_endpoint_accesses

  account     = each.value.account
  domain_name = each.value.domain_name
  region      = each.value.region
}
