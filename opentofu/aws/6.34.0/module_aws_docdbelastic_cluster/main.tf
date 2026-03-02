resource "aws_docdbelastic_cluster" "docdbelastic_clusters" {
  for_each = var.docdbelastic_clusters

  admin_user_name              = each.value.admin_user_name
  admin_user_password          = each.value.admin_user_password
  auth_type                    = each.value.auth_type
  name                         = each.value.name
  shard_capacity               = each.value.shard_capacity
  shard_count                  = each.value.shard_count
  backup_retention_period      = each.value.backup_retention_period
  kms_key_id                   = each.value.kms_key_id
  preferred_backup_window      = each.value.preferred_backup_window
  preferred_maintenance_window = each.value.preferred_maintenance_window
  region                       = each.value.region
  subnet_ids                   = each.value.subnet_ids
  tags                         = each.value.tags
  vpc_security_group_ids       = each.value.vpc_security_group_ids
}
