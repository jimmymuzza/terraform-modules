variable "email_communication_service_domain_sender_usernames" {
  description = <<EOT
Map of email_communication_service_domain_sender_usernames, attributes below
Required:
    - email_service_domain_id
    - name
Optional:
    - display_name
EOT

  type = map(object({
    email_service_domain_id = string
    name                    = string
    display_name            = optional(string)
  }))
}
