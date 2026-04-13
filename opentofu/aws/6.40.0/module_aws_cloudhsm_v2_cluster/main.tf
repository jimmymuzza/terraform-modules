resource "aws_cloudhsm_v2_cluster" "cloudhsm_v2_clusters" {
  for_each = var.cloudhsm_v2_clusters

  hsm_type                 = each.value.hsm_type
  subnet_ids               = each.value.subnet_ids
  mode                     = each.value.mode
  region                   = each.value.region
  source_backup_identifier = each.value.source_backup_identifier
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
}
