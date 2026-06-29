variable "private_endpoint_application_security_group_associations" {
  description = <<EOT
Map of private_endpoint_application_security_group_associations, attributes below
Required:
    - application_security_group_id
    - private_endpoint_id
EOT

  type = map(object({
    application_security_group_id = string
    private_endpoint_id           = string
  }))
}
