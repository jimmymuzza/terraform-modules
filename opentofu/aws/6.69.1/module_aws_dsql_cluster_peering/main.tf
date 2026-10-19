resource "aws_dsql_cluster_peering" "dsql_cluster_peerings" {
  for_each = var.dsql_cluster_peerings

  clusters       = each.value.clusters
  identifier     = each.value.identifier
  witness_region = each.value.witness_region
  region         = each.value.region
}
