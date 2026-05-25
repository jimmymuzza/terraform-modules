variable "s3vectors_vector_buckets" {
  description = <<EOT
Map of s3vectors_vector_buckets, attributes below
Required:
    - vector_bucket_name
Optional:
    - encryption_configuration
    - force_destroy
    - region
    - tags
EOT

  type = map(object({
    vector_bucket_name       = string
    encryption_configuration = optional(list(object({
            kms_key_arn = string
            sse_type = string
        })))
    force_destroy            = optional(bool)
    region                   = optional(string)
    tags                     = optional(map(string))
  }))
}
