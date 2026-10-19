variable "subnet_network_security_group_associations" {
  description = <<EOT
Map of subnet_network_security_group_associations, attributes below
Required:
    - network_security_group_id
    - subnet_id
EOT

  type = map(object({
    network_security_group_id = string
    subnet_id                 = string
  }))
}
