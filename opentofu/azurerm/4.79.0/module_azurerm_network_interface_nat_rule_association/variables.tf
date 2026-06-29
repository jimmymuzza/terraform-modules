variable "network_interface_nat_rule_associations" {
  description = <<EOT
Map of network_interface_nat_rule_associations, attributes below
Required:
    - ip_configuration_name
    - nat_rule_id
    - network_interface_id
EOT

  type = map(object({
    ip_configuration_name = string
    nat_rule_id           = string
    network_interface_id  = string
  }))
}
