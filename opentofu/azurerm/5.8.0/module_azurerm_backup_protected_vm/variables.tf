variable "backup_protected_vms" {
  description = <<EOT
Map of backup_protected_vms, attributes below
Required:
    - recovery_vault_name
    - resource_group_name
Optional:
    - backup_policy_id
    - exclude_disk_luns
    - include_disk_luns
    - protection_state
    - source_vm_id
EOT

  type = map(object({
    recovery_vault_name = string
    resource_group_name = string
    backup_policy_id    = optional(string)
    exclude_disk_luns   = optional(set(number))
    include_disk_luns   = optional(set(number))
    protection_state    = optional(string)
    source_vm_id        = optional(string)
  }))
}
