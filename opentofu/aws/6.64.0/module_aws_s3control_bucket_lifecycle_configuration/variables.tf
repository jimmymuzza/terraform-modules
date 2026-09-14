variable "s3control_bucket_lifecycle_configurations" {
  description = <<EOT
Map of s3control_bucket_lifecycle_configurations, attributes below
Required:
    - bucket
    - rule
Optional:
    - region
EOT

  type = map(object({
    bucket = string
    region = optional(string)
    rule   = set(object({
            status                            = optional(string)
            abort_incomplete_multipart_upload = optional(list(object({
                days_after_initiation = number
            })))
            expiration                        = optional(list(object({
                date                         = optional(string)
                days                         = optional(number)
                expired_object_delete_marker = optional(bool)
            })))
            filter                            = optional(list(object({
                prefix = optional(string)
                tags   = optional(map(string))
            })))
        }))
  }))
}
