variable "mssql_outbound_firewall_rules" {
  description = <<EOT
Map of mssql_outbound_firewall_rules, attributes below
Required:
    - name
    - server_id
EOT

  type = map(object({
    name      = string
    server_id = string
  }))
}
