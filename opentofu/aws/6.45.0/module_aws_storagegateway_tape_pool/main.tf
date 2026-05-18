resource "aws_storagegateway_tape_pool" "storagegateway_tape_pools" {
  for_each = var.storagegateway_tape_pools

  pool_name                   = each.value.pool_name
  storage_class               = each.value.storage_class
  region                      = each.value.region
  retention_lock_time_in_days = each.value.retention_lock_time_in_days
  retention_lock_type         = each.value.retention_lock_type
  tags                        = each.value.tags
  tags_all                    = each.value.tags_all
}
