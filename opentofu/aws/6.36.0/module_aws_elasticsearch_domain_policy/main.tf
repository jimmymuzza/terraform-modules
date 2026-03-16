resource "aws_elasticsearch_domain_policy" "elasticsearch_domain_policies" {
  for_each = var.elasticsearch_domain_policies

  access_policies = each.value.access_policies
  domain_name     = each.value.domain_name
  region          = each.value.region
}
