variable "network_manager_routing_rules" {
  description = <<EOT
Map of network_manager_routing_rules, attributes below
Required:
    - name
    - rule_collection_id
    - destination
    - next_hop
Optional:
    - description
EOT

  type = map(object({
    name               = string
    rule_collection_id = string
    description        = optional(string)
    destination        = list(object({
            address = string
            type    = string
        }))
    next_hop           = list(object({
            type    = string
            address = optional(string)
        }))
  }))
}
