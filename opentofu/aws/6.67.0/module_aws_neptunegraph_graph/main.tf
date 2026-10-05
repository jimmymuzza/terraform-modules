resource "aws_neptunegraph_graph" "neptunegraph_graphs" {
  for_each = var.neptunegraph_graphs

  provisioned_memory  = each.value.provisioned_memory
  deletion_protection = each.value.deletion_protection
  graph_name          = each.value.graph_name
  graph_name_prefix   = each.value.graph_name_prefix
  kms_key_identifier  = each.value.kms_key_identifier
  public_connectivity = each.value.public_connectivity
  region              = each.value.region
  replica_count       = each.value.replica_count
  tags                = each.value.tags

  dynamic "vector_search_configuration" {
    for_each = each.value.vector_search_configuration != null ? each.value.vector_search_configuration : []
    content {
      vector_search_dimension = vector_search_configuration.value.vector_search_dimension
    }
  }
}
