variable "site_recovery_hyperv_replication_policy_associations" {
  description = <<EOT
Map of site_recovery_hyperv_replication_policy_associations, attributes below
Required:
    - hyperv_site_id
    - name
    - policy_id
EOT

  type = map(object({
    hyperv_site_id = string
    name           = string
    policy_id      = string
  }))
}
