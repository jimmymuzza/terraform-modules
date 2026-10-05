variable "elasticache_serverless_caches" {
  description = <<EOT
Map of elasticache_serverless_caches, attributes below
Required:
    - engine
    - name
Optional:
    - daily_snapshot_time
    - description
    - kms_key_id
    - major_engine_version
    - network_type
    - region
    - security_group_ids
    - snapshot_arns_to_restore
    - snapshot_retention_limit
    - subnet_ids
    - tags
    - user_group_id
    - cache_usage_limits
EOT

  type = map(object({
    engine                   = string
    name                     = string
    daily_snapshot_time      = optional(string)
    description              = optional(string)
    kms_key_id               = optional(string)
    major_engine_version     = optional(string)
    network_type             = optional(string)
    region                   = optional(string)
    security_group_ids       = optional(set(string))
    snapshot_arns_to_restore = optional(list(string))
    snapshot_retention_limit = optional(number)
    subnet_ids               = optional(set(string))
    tags                     = optional(map(string))
    user_group_id            = optional(string)
    cache_usage_limits       = optional(list(object({
            data_storage    = optional(list(object({
                unit    = string
                maximum = optional(number)
                minimum = optional(number)
            })))
            ecpu_per_second = optional(list(object({
                maximum = optional(number)
                minimum = optional(number)
            })))
        })))
  }))
}
