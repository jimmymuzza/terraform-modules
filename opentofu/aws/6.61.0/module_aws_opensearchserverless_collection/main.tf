resource "aws_opensearchserverless_collection" "opensearchserverless_collections" {
  for_each = var.opensearchserverless_collections

  name                  = each.value.name
  collection_group_name = each.value.collection_group_name
  description           = each.value.description
  encryption_config     = each.value.encryption_config
  region                = each.value.region
  standby_replicas      = each.value.standby_replicas
  tags                  = each.value.tags
  type                  = each.value.type
  vector_options        = each.value.vector_options
}
