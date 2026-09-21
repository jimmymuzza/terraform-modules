variable "recovery_services_vault_resource_guard_associations" {
  description = <<EOT
Map of recovery_services_vault_resource_guard_associations, attributes below
Required:
    - resource_guard_id
    - vault_id
EOT

  type = map(object({
    resource_guard_id = string
    vault_id          = string
  }))
}
