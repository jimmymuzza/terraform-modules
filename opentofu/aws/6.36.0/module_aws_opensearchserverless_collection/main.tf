resource "aws_opensearchserverless_collection" "opensearchserverless_collections" {
  for_each = var.opensearchserverless_collections

  name             = each.value.name
  description      = each.value.description
  region           = each.value.region
  standby_replicas = each.value.standby_replicas
  tags             = each.value.tags
  type             = each.value.type
}
