variable "s3_bucket_loggings" {
  description = <<EOT
Map of s3_bucket_loggings, attributes below
Required:
    - bucket
    - target_bucket
    - target_prefix
Optional:
    - expected_bucket_owner
    - region
    - target_grant
    - target_object_key_format
EOT

  type = map(object({
    bucket                   = string
    target_bucket            = string
    target_prefix            = string
    expected_bucket_owner    = optional(string)
    region                   = optional(string)
    target_grant             = optional(set(object({
            permission = string
            grantee    = list(object({
                type          = string
                email_address = optional(string)
                uri           = optional(string)
            }))
        })))
    target_object_key_format = optional(list(object({
            partitioned_prefix = optional(list(object({
                partition_date_source = string
            })))
            simple_prefix      = optional(list(object({

            })))
        })))
  }))
}
