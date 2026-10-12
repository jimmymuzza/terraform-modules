variable "kinesis_streams" {
  description = <<EOT
Map of kinesis_streams, attributes below
Required:
    - name
Optional:
    - arn
    - encryption_type
    - enforce_consumer_deletion
    - kms_key_id
    - max_record_size_in_kib
    - region
    - retention_period
    - shard_count
    - shard_level_metrics
    - tags
    - tags_all
    - warm_throughput_mib_ps
    - stream_mode_details
EOT

  type = map(object({
    name                      = string
    arn                       = optional(string)
    encryption_type           = optional(string)
    enforce_consumer_deletion = optional(bool)
    kms_key_id                = optional(string)
    max_record_size_in_kib    = optional(number)
    region                    = optional(string)
    retention_period          = optional(number)
    shard_count               = optional(number)
    shard_level_metrics       = optional(set(string))
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    warm_throughput_mib_ps    = optional(number)
    stream_mode_details       = optional(list(object({
            stream_mode = string
        })))
  }))
}
