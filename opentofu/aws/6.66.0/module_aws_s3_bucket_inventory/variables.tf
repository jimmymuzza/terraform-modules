variable "s3_bucket_inventories" {
  description = <<EOT
Map of s3_bucket_inventories, attributes below
Required:
    - bucket
    - included_object_versions
    - name
    - destination
    - schedule
Optional:
    - enabled
    - optional_fields
    - region
    - filter
EOT

  type = map(object({
    bucket                   = string
    included_object_versions = string
    name                     = string
    enabled                  = optional(bool)
    optional_fields          = optional(set(string))
    region                   = optional(string)
    destination              = list(object({
            bucket = list(object({
                bucket_arn = string
                format     = string
                account_id = optional(string)
                prefix     = optional(string)
                encryption = optional(list(object({
                    sse_kms = optional(list(object({
                        key_id = string
                    })))
                    sse_s3  = optional(list(object({

                    })))
                })))
            }))
        }))
    filter                   = optional(list(object({
            prefix = optional(string)
        })))
    schedule                 = list(object({
            frequency = string
        }))
  }))
}
