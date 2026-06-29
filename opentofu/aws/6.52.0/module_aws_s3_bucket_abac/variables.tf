variable "s3_bucket_abacs" {
  description = <<EOT
Map of s3_bucket_abacs, attributes below
Required:
    - bucket
Optional:
    - expected_bucket_owner
    - region
    - abac_status
EOT

  type = map(object({
    bucket                = string
    expected_bucket_owner = optional(string)
    region                = optional(string)
    abac_status           = optional(list(object({
            status = string
        })))
  }))
}
