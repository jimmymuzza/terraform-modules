variable "key_vault_managed_hardware_security_module_keys" {
  description = <<EOT
Map of key_vault_managed_hardware_security_module_keys, attributes below
Required:
    - key_opts
    - key_type
    - managed_hsm_id
    - name
Optional:
    - curve
    - expiration_date
    - key_size
    - not_before_date
    - tags
EOT

  type = map(object({
    key_opts        = set(string)
    key_type        = string
    managed_hsm_id  = string
    name            = string
    curve           = optional(string)
    expiration_date = optional(string)
    key_size        = optional(number)
    not_before_date = optional(string)
    tags            = optional(map(string))
  }))
}
