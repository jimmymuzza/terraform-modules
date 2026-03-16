variable "communication_service_email_domain_associations" {
  description = <<EOT
Map of communication_service_email_domain_associations, attributes below
Required:
    - communication_service_id
    - email_service_domain_id
EOT

  type = map(object({
    communication_service_id = string
    email_service_domain_id  = string
  }))
}
