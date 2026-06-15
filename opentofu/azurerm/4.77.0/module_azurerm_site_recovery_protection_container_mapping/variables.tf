variable "site_recovery_protection_container_mappings" {
  description = <<EOT
Map of site_recovery_protection_container_mappings, attributes below
Required:
    - name
    - recovery_fabric_name
    - recovery_replication_policy_id
    - recovery_source_protection_container_name
    - recovery_target_protection_container_id
    - recovery_vault_name
    - resource_group_name
Optional:
    - automatic_update
EOT

  type = map(object({
    name                                      = string
    recovery_fabric_name                      = string
    recovery_replication_policy_id            = string
    recovery_source_protection_container_name = string
    recovery_target_protection_container_id   = string
    recovery_vault_name                       = string
    resource_group_name                       = string
    automatic_update                          = optional(list(object({
            authentication_type   = optional(string)
            automation_account_id = optional(string)
            enabled               = optional(bool)
        })))
  }))
}
