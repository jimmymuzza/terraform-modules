variable "cosmosdb_postgresql_firewall_rules" {
  description = <<EOT
Map of cosmosdb_postgresql_firewall_rules, attributes below
Required:
    - cluster_id
    - end_ip_address
    - name
    - start_ip_address
EOT

  type = map(object({
    cluster_id       = string
    end_ip_address   = string
    name             = string
    start_ip_address = string
  }))
}
