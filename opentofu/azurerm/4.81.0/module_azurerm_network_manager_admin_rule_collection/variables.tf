variable "network_manager_admin_rule_collections" {
  description = <<EOT
Map of network_manager_admin_rule_collections, attributes below
Required:
    - name
    - network_group_ids
    - security_admin_configuration_id
Optional:
    - description
EOT

  type = map(object({
    name                            = string
    network_group_ids               = list(string)
    security_admin_configuration_id = string
    description                     = optional(string)
  }))
}
