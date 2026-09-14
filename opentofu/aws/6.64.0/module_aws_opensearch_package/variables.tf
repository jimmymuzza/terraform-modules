variable "opensearch_packages" {
  description = <<EOT
Map of opensearch_packages, attributes below
Required:
    - package_name
    - package_type
    - package_source
Optional:
    - engine_version
    - package_description
    - region
EOT

  type = map(object({
    package_name        = string
    package_type        = string
    engine_version      = optional(string)
    package_description = optional(string)
    region              = optional(string)
    package_source      = list(object({
            s3_bucket_name = string
            s3_key         = string
        }))
  }))
}
