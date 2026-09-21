variable "security_center_contacts" {
  description = <<EOT
Map of security_center_contacts, attributes below
Required:
    - alert_notifications
    - alerts_to_admins
    - email
    - name
Optional:
    - phone
EOT

  type = map(object({
    alert_notifications = bool
    alerts_to_admins    = bool
    email               = string
    name                = string
    phone               = optional(string)
  }))
}
