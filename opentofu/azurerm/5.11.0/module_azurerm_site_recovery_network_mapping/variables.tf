variable "site_recovery_network_mappings" {
  description = <<EOT
Map of site_recovery_network_mappings, attributes below
Required:
    - name
    - recovery_vault_name
    - resource_group_name
    - source_network_id
    - source_recovery_fabric_name
    - target_network_id
    - target_recovery_fabric_name
EOT

  type = map(object({
    name                        = string
    recovery_vault_name         = string
    resource_group_name         = string
    source_network_id           = string
    source_recovery_fabric_name = string
    target_network_id           = string
    target_recovery_fabric_name = string
  }))
}
