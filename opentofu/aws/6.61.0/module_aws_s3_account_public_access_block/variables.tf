variable "s3_account_public_access_blocks" {
  description = <<EOT
Map of s3_account_public_access_blocks, attributes below
Optional:
    - account_id
    - block_public_acls
    - block_public_policy
    - ignore_public_acls
    - restrict_public_buckets
EOT

  type = map(object({
    account_id              = optional(string)
    block_public_acls       = optional(bool)
    block_public_policy     = optional(bool)
    ignore_public_acls      = optional(bool)
    restrict_public_buckets = optional(bool)
  }))
}
