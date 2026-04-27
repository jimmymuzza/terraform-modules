resource "aws_service_discovery_http_namespace" "service_discovery_http_namespaces" {
  for_each = var.service_discovery_http_namespaces

  name        = each.value.name
  description = each.value.description
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all
}
