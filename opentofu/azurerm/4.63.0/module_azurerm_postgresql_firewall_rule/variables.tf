variable "postgresql_firewall_rules" {
  description = <<EOT
Map of postgresql_firewall_rules, attributes below
Required:
    - end_ip_address
    - name
    - resource_group_name
    - server_name
    - start_ip_address
EOT

  type = map(object({
    end_ip_address      = string
    name                = string
    resource_group_name = string
    server_name         = string
    start_ip_address    = string
  }))
}
