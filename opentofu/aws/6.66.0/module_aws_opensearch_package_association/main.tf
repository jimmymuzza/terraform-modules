resource "aws_opensearch_package_association" "opensearch_package_associations" {
  for_each = var.opensearch_package_associations

  domain_name = each.value.domain_name
  package_id  = each.value.package_id
  region      = each.value.region
}
