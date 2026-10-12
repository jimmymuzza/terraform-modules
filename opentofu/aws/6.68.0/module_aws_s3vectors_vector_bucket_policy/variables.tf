variable "s3vectors_vector_bucket_policies" {
  description = <<EOT
Map of s3vectors_vector_bucket_policies, attributes below
Required:
    - policy
    - vector_bucket_arn
Optional:
    - region
EOT

  type = map(object({
    policy            = string
    vector_bucket_arn = string
    region            = optional(string)
  }))
}
