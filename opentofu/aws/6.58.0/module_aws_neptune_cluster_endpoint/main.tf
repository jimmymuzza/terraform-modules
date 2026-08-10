resource "aws_neptune_cluster_endpoint" "neptune_cluster_endpoints" {
  for_each = var.neptune_cluster_endpoints

  cluster_endpoint_identifier = each.value.cluster_endpoint_identifier
  cluster_identifier          = each.value.cluster_identifier
  endpoint_type               = each.value.endpoint_type
  excluded_members            = each.value.excluded_members
  region                      = each.value.region
  static_members              = each.value.static_members
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
