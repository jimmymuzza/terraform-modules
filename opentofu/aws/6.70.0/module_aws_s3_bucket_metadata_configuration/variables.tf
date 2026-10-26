variable "s3_bucket_metadata_configurations" {
  description = <<EOT
Map of s3_bucket_metadata_configurations, attributes below
Required:
    - bucket
Optional:
    - expected_bucket_owner
    - region
    - metadata_configuration
EOT

  type = map(object({
    bucket                 = string
    expected_bucket_owner  = optional(string)
    region                 = optional(string)
    metadata_configuration = optional(list(object({
            inventory_table_configuration = optional(list(object({
                configuration_state      = string
                encryption_configuration = optional(list(object({
                    sse_algorithm = string
                    kms_key_arn   = optional(string)
                })))
            })))
            journal_table_configuration   = optional(list(object({
                encryption_configuration = optional(list(object({
                    sse_algorithm = string
                    kms_key_arn   = optional(string)
                })))
                record_expiration        = optional(list(object({
                    expiration = string
                    days       = optional(number)
                })))
            })))
        })))
  }))
}
