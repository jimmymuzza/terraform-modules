variable "s3control_bucket_policies" {
  description = <<EOT
Map of s3control_bucket_policies, attributes below
Required:
    - bucket
    - policy
Optional:
    - region
EOT

  type = map(object({
    bucket = string
    policy = string
    region = optional(string)
  }))
}
