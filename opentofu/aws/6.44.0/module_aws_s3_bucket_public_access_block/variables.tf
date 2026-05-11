variable "s3_bucket_public_access_blocks" {
  description = <<EOT
Map of s3_bucket_public_access_blocks, attributes below
Required:
    - bucket
Optional:
    - block_public_acls
    - block_public_policy
    - ignore_public_acls
    - region
    - restrict_public_buckets
    - skip_destroy
EOT

  type = map(object({
    bucket                  = string
    block_public_acls       = optional(bool)
    block_public_policy     = optional(bool)
    ignore_public_acls      = optional(bool)
    region                  = optional(string)
    restrict_public_buckets = optional(bool)
    skip_destroy            = optional(bool)
  }))
}
