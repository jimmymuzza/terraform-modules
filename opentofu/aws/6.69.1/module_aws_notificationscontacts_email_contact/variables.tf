variable "notificationscontacts_email_contacts" {
  description = <<EOT
Map of notificationscontacts_email_contacts, attributes below
Required:
    - email_address
    - name
Optional:
    - tags
EOT

  type = map(object({
    email_address = string
    name          = string
    tags          = optional(map(string))
  }))
}
