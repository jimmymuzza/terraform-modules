variable "connect_instance_storage_configs" {
  description = <<EOT
Map of connect_instance_storage_configs, attributes below
Required:
    - instance_id
    - resource_type
    - storage_config
Optional:
    - region
EOT

  type = map(object({
    instance_id    = string
    resource_type  = string
    region         = optional(string)
    storage_config = list(object({
            storage_type                = string
            kinesis_firehose_config     = optional(list(object({
                firehose_arn = string
            })))
            kinesis_stream_config       = optional(list(object({
                stream_arn = string
            })))
            kinesis_video_stream_config = optional(list(object({
                prefix                 = string
                retention_period_hours = number
                encryption_config      = list(object({
                    encryption_type = string
                    key_id          = string
                }))
            })))
            s3_config                   = optional(list(object({
                bucket_name       = string
                bucket_prefix     = string
                encryption_config = optional(list(object({
                    encryption_type = string
                    key_id          = string
                })))
            })))
        }))
  }))
}
