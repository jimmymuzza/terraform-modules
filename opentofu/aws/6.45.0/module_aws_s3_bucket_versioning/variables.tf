variable "s3_bucket_versionings" {
  description = <<EOT
Map of s3_bucket_versionings, attributes below
Required:
    - bucket
    - versioning_configuration
Optional:
    - expected_bucket_owner
    - mfa
    - region
EOT

  type = map(object({
    bucket                   = string
    expected_bucket_owner    = optional(string)
    mfa                      = optional(string)
    region                   = optional(string)
    versioning_configuration = list(object({
            status     = string
            mfa_delete = optional(string)
        }))
  }))
}
