variable "lb_trust_store_revocations" {
  description = <<EOT
Map of lb_trust_store_revocations, attributes below
Required:
    - revocations_s3_bucket
    - revocations_s3_key
    - trust_store_arn
Optional:
    - region
    - revocations_s3_object_version
EOT

  type = map(object({
    revocations_s3_bucket         = string
    revocations_s3_key            = string
    trust_store_arn               = string
    region                        = optional(string)
    revocations_s3_object_version = optional(string)
  }))
}
