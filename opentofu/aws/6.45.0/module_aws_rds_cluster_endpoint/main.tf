resource "aws_rds_cluster_endpoint" "rds_cluster_endpoints" {
  for_each = var.rds_cluster_endpoints

  cluster_endpoint_identifier = each.value.cluster_endpoint_identifier
  cluster_identifier          = each.value.cluster_identifier
  custom_endpoint_type        = each.value.custom_endpoint_type
  excluded_members            = each.value.excluded_members
  region                      = each.value.region
  static_members              = each.value.static_members
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
