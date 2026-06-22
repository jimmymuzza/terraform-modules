variable "cost_anomaly_alerts" {
  description = <<EOT
Map of cost_anomaly_alerts, attributes below
Required:
    - display_name
    - email_addresses
    - email_subject
    - name
Optional:
    - message
    - notification_email
    - subscription_id
EOT

  type = map(object({
    display_name       = string
    email_addresses    = set(string)
    email_subject      = string
    name               = string
    message            = optional(string)
    notification_email = optional(string)
    subscription_id    = optional(string)
  }))
}
