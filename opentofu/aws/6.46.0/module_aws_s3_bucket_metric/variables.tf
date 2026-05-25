variable "s3_bucket_metrics" {
  description = <<EOT
Map of s3_bucket_metrics, attributes below
Required:
    - bucket
    - name
Optional:
    - region
    - filter
EOT

  type = map(object({
    bucket = string
    name   = string
    region = optional(string)
    filter = optional(list(object({
            access_point = optional(string)
            prefix       = optional(string)
            tags         = optional(map(string))
        })))
  }))
}
