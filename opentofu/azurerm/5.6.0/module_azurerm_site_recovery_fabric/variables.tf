variable "site_recovery_fabrics" {
  description = <<EOT
Map of site_recovery_fabrics, attributes below
Required:
    - location
    - name
    - recovery_vault_name
    - resource_group_name
EOT

  type = map(object({
    location            = string
    name                = string
    recovery_vault_name = string
    resource_group_name = string
  }))
}
