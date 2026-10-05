variable "config_delivery_channels" {
  description = <<EOT
Map of config_delivery_channels, attributes below
Required:
    - s3_bucket_name
Optional:
    - name
    - region
    - s3_key_prefix
    - s3_kms_key_arn
    - sns_topic_arn
    - snapshot_delivery_properties
EOT

  type = map(object({
    s3_bucket_name               = string
    name                         = optional(string)
    region                       = optional(string)
    s3_key_prefix                = optional(string)
    s3_kms_key_arn               = optional(string)
    sns_topic_arn                = optional(string)
    snapshot_delivery_properties = optional(list(object({
            delivery_frequency = optional(string)
        })))
  }))
}
