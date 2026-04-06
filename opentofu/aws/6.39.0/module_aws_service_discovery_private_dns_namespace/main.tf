resource "aws_service_discovery_private_dns_namespace" "service_discovery_private_dns_namespaces" {
  for_each = var.service_discovery_private_dns_namespaces

  name        = each.value.name
  vpc         = each.value.vpc
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
