variable "s3_bucket_request_payment_configurations" {
  description = <<EOT
Map of s3_bucket_request_payment_configurations, attributes below
Required:
    - bucket
    - payer
Optional:
    - expected_bucket_owner
    - region
EOT

  type = map(object({
    bucket                = string
    payer                 = string
    expected_bucket_owner = optional(string)
    region                = optional(string)
  }))
}
