variable "key_vault_managed_hardware_security_module_role_definitions" {
  description = <<EOT
Map of key_vault_managed_hardware_security_module_role_definitions, attributes below
Required:
    - managed_hsm_id
    - name
Optional:
    - description
    - role_name
    - permission
EOT

  type = map(object({
    managed_hsm_id = string
    name           = string
    description    = optional(string)
    role_name      = optional(string)
    permission     = optional(list(object({
            actions          = optional(list(string))
            data_actions     = optional(set(string))
            not_actions      = optional(list(string))
            not_data_actions = optional(set(string))
        })))
  }))
}
