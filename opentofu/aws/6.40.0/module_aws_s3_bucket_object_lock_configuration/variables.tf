variable "s3_bucket_object_lock_configurations" {
  description = <<EOT
Map of s3_bucket_object_lock_configurations, attributes below
Required:
    - bucket
Optional:
    - expected_bucket_owner
    - object_lock_enabled
    - region
    - token
    - rule
EOT

  type = map(object({
    bucket                = string
    expected_bucket_owner = optional(string)
    object_lock_enabled   = optional(string)
    region                = optional(string)
    token                 = optional(string)
    rule                  = optional(list(object({
            default_retention = list(object({
                days  = optional(number)
                mode  = optional(string)
                years = optional(number)
            }))
        })))
  }))
}
