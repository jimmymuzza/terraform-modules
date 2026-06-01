variable "site_recovery_hyperv_replication_policies" {
  description = <<EOT
Map of site_recovery_hyperv_replication_policies, attributes below
Required:
    - application_consistent_snapshot_frequency_in_hours
    - name
    - recovery_point_retention_in_hours
    - recovery_vault_id
    - replication_interval_in_seconds
EOT

  type = map(object({
    application_consistent_snapshot_frequency_in_hours = number
    name                                               = string
    recovery_point_retention_in_hours                  = number
    recovery_vault_id                                  = string
    replication_interval_in_seconds                    = number
  }))
}
