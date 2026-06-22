variable "site_recovery_vmware_replication_policy_associations" {
  description = <<EOT
Map of site_recovery_vmware_replication_policy_associations, attributes below
Required:
    - name
    - policy_id
    - recovery_vault_id
EOT

  type = map(object({
    name              = string
    policy_id         = string
    recovery_vault_id = string
  }))
}
