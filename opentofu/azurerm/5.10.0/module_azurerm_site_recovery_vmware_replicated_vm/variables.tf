variable "site_recovery_vmware_replicated_vms" {
  description = <<EOT
Map of site_recovery_vmware_replicated_vms, attributes below
Required:
    - appliance_name
    - name
    - physical_server_credential_name
    - recovery_replication_policy_id
    - recovery_vault_id
    - source_vm_name
    - target_resource_group_id
    - target_vm_name
Optional:
    - default_log_storage_account_id
    - default_recovery_disk_type
    - default_target_disk_encryption_set_id
    - license_type
    - multi_vm_group_name
    - target_availability_set_id
    - target_boot_diagnostics_storage_account_id
    - target_network_id
    - target_proximity_placement_group_id
    - target_vm_size
    - target_zone
    - test_network_id
    - managed_disk
    - network_interface
EOT

  type = map(object({
    appliance_name                             = string
    name                                       = string
    physical_server_credential_name            = string
    recovery_replication_policy_id             = string
    recovery_vault_id                          = string
    source_vm_name                             = string
    target_resource_group_id                   = string
    target_vm_name                             = string
    default_log_storage_account_id             = optional(string)
    default_recovery_disk_type                 = optional(string)
    default_target_disk_encryption_set_id      = optional(string)
    license_type                               = optional(string)
    multi_vm_group_name                        = optional(string)
    target_availability_set_id                 = optional(string)
    target_boot_diagnostics_storage_account_id = optional(string)
    target_network_id                          = optional(string)
    target_proximity_placement_group_id        = optional(string)
    target_vm_size                             = optional(string)
    target_zone                                = optional(string)
    test_network_id                            = optional(string)
    managed_disk                               = optional(list(object({
            disk_id                       = string
            target_disk_type              = string
            log_storage_account_id        = optional(string)
            target_disk_encryption_set_id = optional(string)
        })))
    network_interface                          = optional(list(object({
            is_primary         = bool
            source_mac_address = string
            target_static_ip   = optional(string)
            target_subnet_name = optional(string)
            test_subnet_name   = optional(string)
        })))
  }))
}
