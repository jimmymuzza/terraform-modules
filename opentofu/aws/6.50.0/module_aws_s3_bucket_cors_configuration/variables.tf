variable "s3_bucket_cors_configurations" {
  description = <<EOT
Map of s3_bucket_cors_configurations, attributes below
Required:
    - bucket
    - cors_rule
Optional:
    - expected_bucket_owner
    - region
EOT

  type = map(object({
    bucket                = string
    expected_bucket_owner = optional(string)
    region                = optional(string)
    cors_rule             = set(object({
            allowed_methods = set(string)
            allowed_origins = set(string)
            allowed_headers = optional(set(string))
            expose_headers  = optional(set(string))
            max_age_seconds = optional(number)
        }))
  }))
}
