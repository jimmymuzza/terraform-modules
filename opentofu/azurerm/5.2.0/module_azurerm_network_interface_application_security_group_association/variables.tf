variable "network_interface_application_security_group_associations" {
  description = <<EOT
Map of network_interface_application_security_group_associations, attributes below
Required:
    - application_security_group_id
    - network_interface_id
EOT

  type = map(object({
    application_security_group_id = string
    network_interface_id          = string
  }))
}
