variable "s3_bucket_ownership_controls" {
  description = <<EOT
Map of s3_bucket_ownership_controls, attributes below
Required:
    - bucket
    - rule
Optional:
    - region
EOT

  type = map(object({
    bucket = string
    region = optional(string)
    rule   = list(object({
            object_ownership = string
        }))
  }))
}
