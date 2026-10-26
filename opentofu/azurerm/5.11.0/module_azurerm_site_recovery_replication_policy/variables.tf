variable "site_recovery_replication_policies" {
  description = <<EOT
Map of site_recovery_replication_policies, attributes below
Required:
    - application_consistent_snapshot_frequency_in_minutes
    - name
    - recovery_point_retention_in_minutes
    - recovery_vault_name
    - resource_group_name
EOT

  type = map(object({
    application_consistent_snapshot_frequency_in_minutes = number
    name                                                 = string
    recovery_point_retention_in_minutes                  = number
    recovery_vault_name                                  = string
    resource_group_name                                  = string
  }))
}
