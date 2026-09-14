variable "site_recovery_services_vault_hyperv_sites" {
  description = <<EOT
Map of site_recovery_services_vault_hyperv_sites, attributes below
Required:
    - name
    - recovery_vault_id
EOT

  type = map(object({
    name              = string
    recovery_vault_id = string
  }))
}
