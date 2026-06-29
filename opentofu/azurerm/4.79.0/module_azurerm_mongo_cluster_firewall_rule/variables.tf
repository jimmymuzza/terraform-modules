variable "mongo_cluster_firewall_rules" {
  description = <<EOT
Map of mongo_cluster_firewall_rules, attributes below
Required:
    - end_ip_address
    - mongo_cluster_id
    - name
    - start_ip_address
EOT

  type = map(object({
    end_ip_address   = string
    mongo_cluster_id = string
    name             = string
    start_ip_address = string
  }))
}
