resource "aws_opensearch_domain_policy" "opensearch_domain_policies" {
  for_each = var.opensearch_domain_policies

  access_policies = each.value.access_policies
  domain_name     = each.value.domain_name
  region          = each.value.region
}
