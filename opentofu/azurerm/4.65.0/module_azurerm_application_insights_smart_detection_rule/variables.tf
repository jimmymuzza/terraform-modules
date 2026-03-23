variable "application_insights_smart_detection_rules" {
  description = <<EOT
Map of application_insights_smart_detection_rules, attributes below
Required:
    - application_insights_id
    - name
Optional:
    - additional_email_recipients
    - enabled
    - send_emails_to_subscription_owners
EOT

  type = map(object({
    application_insights_id            = string
    name                               = string
    additional_email_recipients        = optional(set(string))
    enabled                            = optional(bool)
    send_emails_to_subscription_owners = optional(bool)
  }))
}
