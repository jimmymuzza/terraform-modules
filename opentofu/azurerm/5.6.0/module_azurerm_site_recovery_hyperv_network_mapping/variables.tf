variable "site_recovery_hyperv_network_mappings" {
  description = <<EOT
Map of site_recovery_hyperv_network_mappings, attributes below
Required:
    - name
    - recovery_vault_id
    - source_network_name
    - source_system_center_virtual_machine_manager_name
    - target_network_id
EOT

  type = map(object({
    name                                              = string
    recovery_vault_id                                 = string
    source_network_name                               = string
    source_system_center_virtual_machine_manager_name = string
    target_network_id                                 = string
  }))
}
