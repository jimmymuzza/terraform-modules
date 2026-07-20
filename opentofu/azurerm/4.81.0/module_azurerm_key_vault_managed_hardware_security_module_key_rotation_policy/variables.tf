variable "key_vault_managed_hardware_security_module_key_rotation_policies" {
  description = <<EOT
Map of key_vault_managed_hardware_security_module_key_rotation_policies, attributes below
Required:
    - expire_after
    - managed_hsm_key_id
Optional:
    - time_after_creation
    - time_before_expiry
EOT

  type = map(object({
    expire_after        = string
    managed_hsm_key_id  = string
    time_after_creation = optional(string)
    time_before_expiry  = optional(string)
  }))
}
