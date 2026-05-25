variable "s3_bucket_server_side_encryption_configurations" {
  description = <<EOT
Map of s3_bucket_server_side_encryption_configurations, attributes below
Required:
    - bucket
    - rule
Optional:
    - expected_bucket_owner
    - region
EOT

  type = map(object({
    bucket                = string
    expected_bucket_owner = optional(string)
    region                = optional(string)
    rule                  = set(object({
            blocked_encryption_types                = optional(list(string))
            bucket_key_enabled                      = optional(bool)
            apply_server_side_encryption_by_default = optional(list(object({
                sse_algorithm     = string
                kms_master_key_id = optional(string)
            })))
        }))
  }))
}
