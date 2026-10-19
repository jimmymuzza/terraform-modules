variable "key_vault_managed_hardware_security_module_role_assignments" {
  description = <<EOT
Map of key_vault_managed_hardware_security_module_role_assignments, attributes below
Required:
    - managed_hsm_id
    - name
    - principal_id
    - role_definition_id
    - scope
EOT

  type = map(object({
    managed_hsm_id     = string
    name               = string
    principal_id       = string
    role_definition_id = string
    scope              = string
  }))
}
