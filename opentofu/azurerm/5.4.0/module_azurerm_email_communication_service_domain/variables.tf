variable "email_communication_service_domains" {
  description = <<EOT
Map of email_communication_service_domains, attributes below
Required:
    - domain_management
    - email_service_id
    - name
Optional:
    - tags
    - user_engagement_tracking_enabled
EOT

  type = map(object({
    domain_management                = string
    email_service_id                 = string
    name                             = string
    tags                             = optional(map(string))
    user_engagement_tracking_enabled = optional(bool)
  }))
}
