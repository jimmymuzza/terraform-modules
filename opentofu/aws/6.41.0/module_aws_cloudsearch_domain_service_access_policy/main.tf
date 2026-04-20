resource "aws_cloudsearch_domain_service_access_policy" "cloudsearch_domain_service_access_policies" {
  for_each = var.cloudsearch_domain_service_access_policies

  access_policy = each.value.access_policy
  domain_name   = each.value.domain_name
  region        = each.value.region
}
