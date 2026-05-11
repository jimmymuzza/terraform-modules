resource "aws_rds_cluster_role_association" "rds_cluster_role_associations" {
  for_each = var.rds_cluster_role_associations

  db_cluster_identifier = each.value.db_cluster_identifier
  role_arn              = each.value.role_arn
  feature_name          = each.value.feature_name
  region                = each.value.region
}
