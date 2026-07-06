variable "sns_sms_preferences" {
  description = <<EOT
Map of sns_sms_preferences, attributes below
Optional:
    - default_sender_id
    - default_sms_type
    - delivery_status_iam_role_arn
    - delivery_status_success_sampling_rate
    - monthly_spend_limit
    - region
    - usage_report_s3_bucket
EOT

  type = map(object({
    default_sender_id                     = optional(string)
    default_sms_type                      = optional(string)
    delivery_status_iam_role_arn          = optional(string)
    delivery_status_success_sampling_rate = optional(string)
    monthly_spend_limit                   = optional(number)
    region                                = optional(string)
    usage_report_s3_bucket                = optional(string)
  }))
}
