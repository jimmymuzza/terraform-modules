variable "s3_bucket_lifecycle_configurations" {
  description = <<EOT
Map of s3_bucket_lifecycle_configurations, attributes below
Required:
    - bucket
Optional:
    - expected_bucket_owner
    - region
    - transition_default_minimum_object_size
    - rule
EOT

  type = map(object({
    bucket                                 = string
    expected_bucket_owner                  = optional(string)
    region                                 = optional(string)
    transition_default_minimum_object_size = optional(string)
    rule                                   = optional(list(object({
            status                            = string
            prefix                            = optional(string)
            abort_incomplete_multipart_upload = optional(list(object({
                days_after_initiation = optional(number)
            })))
            expiration                        = optional(list(object({
                date                         = optional(string)
                days                         = optional(number)
                expired_object_delete_marker = optional(bool)
            })))
            filter                            = optional(list(object({
                object_size_greater_than = optional(number)
                object_size_less_than    = optional(number)
                prefix                   = optional(string)
                and                      = optional(list(object({
                    object_size_greater_than = optional(number)
                    object_size_less_than    = optional(number)
                    prefix                   = optional(string)
                    tags                     = optional(map(string))
                })))
                tag                      = optional(list(object({
                    key   = string
                    value = string
                })))
            })))
            noncurrent_version_expiration     = optional(list(object({
                noncurrent_days           = number
                newer_noncurrent_versions = optional(number)
            })))
            noncurrent_version_transition     = optional(set(object({
                noncurrent_days           = number
                storage_class             = string
                newer_noncurrent_versions = optional(number)
            })))
            transition                        = optional(set(object({
                storage_class = string
                date          = optional(string)
                days          = optional(number)
            })))
        })))
  }))
}
