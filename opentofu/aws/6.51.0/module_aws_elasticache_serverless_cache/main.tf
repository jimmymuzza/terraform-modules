resource "aws_elasticache_serverless_cache" "elasticache_serverless_caches" {
  for_each = var.elasticache_serverless_caches

  engine                   = each.value.engine
  name                     = each.value.name
  daily_snapshot_time      = each.value.daily_snapshot_time
  description              = each.value.description
  kms_key_id               = each.value.kms_key_id
  major_engine_version     = each.value.major_engine_version
  network_type             = each.value.network_type
  region                   = each.value.region
  security_group_ids       = each.value.security_group_ids
  snapshot_arns_to_restore = each.value.snapshot_arns_to_restore
  snapshot_retention_limit = each.value.snapshot_retention_limit
  subnet_ids               = each.value.subnet_ids
  tags                     = each.value.tags
  user_group_id            = each.value.user_group_id

  dynamic "cache_usage_limits" {
    for_each = each.value.cache_usage_limits != null ? each.value.cache_usage_limits : []
    content {

      dynamic "data_storage" {
        for_each = cache_usage_limits.value.data_storage != null ? cache_usage_limits.value.data_storage : []
        content {
          unit    = data_storage.value.unit
          maximum = data_storage.value.maximum
          minimum = data_storage.value.minimum
        }
      }

      dynamic "ecpu_per_second" {
        for_each = cache_usage_limits.value.ecpu_per_second != null ? cache_usage_limits.value.ecpu_per_second : []
        content {
          maximum = ecpu_per_second.value.maximum
          minimum = ecpu_per_second.value.minimum
        }
      }
    }
  }
}
