variable "site_recovery_replicated_vms" {
  description = <<EOT
Map of site_recovery_replicated_vms, attributes below
Required:
    - name
    - recovery_replication_policy_id
    - recovery_vault_name
    - resource_group_name
    - source_recovery_fabric_name
    - source_recovery_protection_container_name
    - source_vm_id
    - target_recovery_fabric_id
    - target_recovery_protection_container_id
    - target_resource_group_id
Optional:
    - managed_disk
    - multi_vm_group_name
    - network_interface
    - target_availability_set_id
    - target_boot_diagnostic_storage_account_id
    - target_capacity_reservation_group_id
    - target_edge_zone
    - target_network_id
    - target_proximity_placement_group_id
    - target_virtual_machine_scale_set_id
    - target_virtual_machine_size
    - target_zone
    - test_network_id
    - unmanaged_disk
EOT

  type = map(object({
    name                                      = string
    recovery_replication_policy_id            = string
    recovery_vault_name                       = string
    resource_group_name                       = string
    source_recovery_fabric_name               = string
    source_recovery_protection_container_name = string
    source_vm_id                              = string
    target_recovery_fabric_id                 = string
    target_recovery_protection_container_id   = string
    target_resource_group_id                  = string
    managed_disk                              = optional(set(object({
            disk_id = string
            staging_storage_account_id = string
            target_disk_encryption = list(object({
                disk_encryption_key = list(object({
                    secret_url = string
                    vault_id = string
                }))
                key_encryption_key = list(object({
                    key_url = string
                    vault_id = string
                }))
            }))
            target_disk_encryption_set_id = string
            target_disk_type = string
            target_replica_disk_type = string
            target_resource_group_id = string
        })))
    multi_vm_group_name                       = optional(string)
    network_interface                         = optional(set(object({
            failover_test_public_ip_address_id = string
            failover_test_static_ip = string
            failover_test_subnet_name = string
            recovery_load_balancer_backend_address_pool_ids = set(string)
            recovery_public_ip_address_id = string
            source_network_interface_id = string
            target_static_ip = string
            target_subnet_name = string
        })))
    target_availability_set_id                = optional(string)
    target_boot_diagnostic_storage_account_id = optional(string)
    target_capacity_reservation_group_id      = optional(string)
    target_edge_zone                          = optional(string)
    target_network_id                         = optional(string)
    target_proximity_placement_group_id       = optional(string)
    target_virtual_machine_scale_set_id       = optional(string)
    target_virtual_machine_size               = optional(string)
    target_zone                               = optional(string)
    test_network_id                           = optional(string)
    unmanaged_disk                            = optional(set(object({
            disk_uri = string
            staging_storage_account_id = string
            target_storage_account_id = string
        })))
  }))
}
