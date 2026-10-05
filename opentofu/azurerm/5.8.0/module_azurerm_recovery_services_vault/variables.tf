variable "recovery_services_vaults" {
  description = <<EOT
Map of recovery_services_vaults, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - classic_vmware_replication_enabled
    - cross_region_restore_enabled
    - immutability
    - public_network_access_enabled
    - storage_mode_type
    - tags
    - encryption
    - identity
    - monitoring
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    sku                                = string
    classic_vmware_replication_enabled = optional(bool)
    cross_region_restore_enabled       = optional(bool)
    immutability                       = optional(string)
    public_network_access_enabled      = optional(bool)
    storage_mode_type                  = optional(string)
    tags                               = optional(map(string))
    encryption                         = optional(list(object({
            infrastructure_encryption_enabled = bool
            key_id                            = string
            use_system_assigned_identity      = optional(bool)
            user_assigned_identity_id         = optional(string)
        })))
    identity                           = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    monitoring                         = optional(list(object({
            alerts_for_all_failover_issues_enabled         = optional(bool)
            alerts_for_all_job_failures_enabled            = optional(bool)
            alerts_for_all_replication_issues_enabled      = optional(bool)
            alerts_for_critical_operation_failures_enabled = optional(bool)
            email_notifications_for_site_recovery_enabled  = optional(bool)
        })))
  }))
}
