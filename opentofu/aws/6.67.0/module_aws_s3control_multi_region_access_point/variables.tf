variable "s3control_multi_region_access_points" {
  description = <<EOT
Map of s3control_multi_region_access_points, attributes below
Required:
    - details
Optional:
    - account_id
    - region
EOT

  type = map(object({
    account_id = optional(string)
    region     = optional(string)
    details    = list(object({
            name                = string
            public_access_block = optional(list(object({
                block_public_acls       = optional(bool)
                block_public_policy     = optional(bool)
                ignore_public_acls      = optional(bool)
                restrict_public_buckets = optional(bool)
            })))
            region              = set(object({
                bucket            = string
                bucket_account_id = optional(string)
            }))
        }))
  }))
}
