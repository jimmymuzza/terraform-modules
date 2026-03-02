variable "glue_security_configurations" {
  description = <<EOT
Map of glue_security_configurations, attributes below
Required:
    - name
    - encryption_configuration
Optional:
    - region
EOT

  type = map(object({
    name                     = string
    region                   = optional(string)
    encryption_configuration = list(object({
            cloudwatch_encryption    = list(object({
                cloudwatch_encryption_mode = optional(string)
                kms_key_arn                = optional(string)
            }))
            job_bookmarks_encryption = list(object({
                job_bookmarks_encryption_mode = optional(string)
                kms_key_arn                   = optional(string)
            }))
            s3_encryption            = list(object({
                kms_key_arn        = optional(string)
                s3_encryption_mode = optional(string)
            }))
        }))
  }))
}
