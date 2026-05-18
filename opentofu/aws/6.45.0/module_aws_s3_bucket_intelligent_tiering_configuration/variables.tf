variable "s3_bucket_intelligent_tiering_configurations" {
  description = <<EOT
Map of s3_bucket_intelligent_tiering_configurations, attributes below
Required:
    - bucket
    - name
    - tiering
Optional:
    - region
    - status
    - filter
EOT

  type = map(object({
    bucket  = string
    name    = string
    region  = optional(string)
    status  = optional(string)
    filter  = optional(list(object({
            prefix = optional(string)
            tags   = optional(map(string))
        })))
    tiering = set(object({
            access_tier = string
            days        = number
        }))
  }))
}
