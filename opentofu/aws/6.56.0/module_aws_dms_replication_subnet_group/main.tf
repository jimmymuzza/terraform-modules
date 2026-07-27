resource "aws_dms_replication_subnet_group" "dms_replication_subnet_groups" {
  for_each = var.dms_replication_subnet_groups

  replication_subnet_group_description = each.value.replication_subnet_group_description
  replication_subnet_group_id          = each.value.replication_subnet_group_id
  subnet_ids                           = each.value.subnet_ids
  region                               = each.value.region
  tags                                 = each.value.tags
  tags_all                             = each.value.tags_all
}
