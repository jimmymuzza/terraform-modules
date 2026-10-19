variable "s3_bucket_accelerate_configurations" {
  description = <<EOT
Map of s3_bucket_accelerate_configurations, attributes below
Required:
    - bucket
    - status
Optional:
    - expected_bucket_owner
    - region
EOT

  type = map(object({
    bucket                = string
    status                = string
    expected_bucket_owner = optional(string)
    region                = optional(string)
  }))
}
