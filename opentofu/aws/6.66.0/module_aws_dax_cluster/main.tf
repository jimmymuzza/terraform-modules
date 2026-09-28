resource "aws_dax_cluster" "dax_clusters" {
  for_each = var.dax_clusters

  cluster_name                     = each.value.cluster_name
  iam_role_arn                     = each.value.iam_role_arn
  node_type                        = each.value.node_type
  replication_factor               = each.value.replication_factor
  availability_zones               = each.value.availability_zones
  cluster_endpoint_encryption_type = each.value.cluster_endpoint_encryption_type
  description                      = each.value.description
  maintenance_window               = each.value.maintenance_window
  notification_topic_arn           = each.value.notification_topic_arn
  parameter_group_name             = each.value.parameter_group_name
  region                           = each.value.region
  security_group_ids               = each.value.security_group_ids
  subnet_group_name                = each.value.subnet_group_name
  tags                             = each.value.tags
  tags_all                         = each.value.tags_all

  dynamic "server_side_encryption" {
    for_each = each.value.server_side_encryption != null ? each.value.server_side_encryption : []
    content {
      enabled = server_side_encryption.value.enabled
    }
  }
}
