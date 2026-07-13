variable "s3_bucket_analytics_configurations" {
  description = <<EOT
Map of s3_bucket_analytics_configurations, attributes below
Required:
    - bucket
    - name
Optional:
    - region
    - filter
    - storage_class_analysis
EOT

  type = map(object({
    bucket                 = string
    name                   = string
    region                 = optional(string)
    filter                 = optional(list(object({
            prefix = optional(string)
            tags   = optional(map(string))
        })))
    storage_class_analysis = optional(list(object({
            data_export = list(object({
                output_schema_version = optional(string)
                destination           = list(object({
                    s3_bucket_destination = list(object({
                        bucket_arn        = string
                        bucket_account_id = optional(string)
                        format            = optional(string)
                        prefix            = optional(string)
                    }))
                }))
            }))
        })))
  }))
}
