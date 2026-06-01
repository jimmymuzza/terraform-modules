resource "aws_opensearchserverless_collection_group" "opensearchserverless_collection_groups" {
  for_each = var.opensearchserverless_collection_groups

  name             = each.value.name
  standby_replicas = each.value.standby_replicas
  capacity_limits  = each.value.capacity_limits
  description      = each.value.description
  region           = each.value.region
  tags             = each.value.tags
}
