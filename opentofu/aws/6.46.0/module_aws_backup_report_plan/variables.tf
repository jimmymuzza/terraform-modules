variable "backup_report_plans" {
  description = <<EOT
Map of backup_report_plans, attributes below
Required:
    - name
    - report_delivery_channel
    - report_setting
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name                    = string
    description             = optional(string)
    region                  = optional(string)
    tags                    = optional(map(string))
    tags_all                = optional(map(string))
    report_delivery_channel = list(object({
            s3_bucket_name = string
            formats        = optional(set(string))
            s3_key_prefix  = optional(string)
        }))
    report_setting          = list(object({
            report_template      = string
            accounts             = optional(set(string))
            framework_arns       = optional(set(string))
            number_of_frameworks = optional(number)
            organization_units   = optional(set(string))
            regions              = optional(set(string))
        }))
  }))
}
