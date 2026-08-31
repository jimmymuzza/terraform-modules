variable "site_recovery_protection_containers" {
  description = <<EOT
Map of site_recovery_protection_containers, attributes below
Required:
    - name
    - recovery_fabric_name
    - recovery_vault_name
    - resource_group_name
EOT

  type = map(object({
    name                 = string
    recovery_fabric_name = string
    recovery_vault_name  = string
    resource_group_name  = string
  }))
}
