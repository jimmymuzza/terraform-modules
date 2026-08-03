variable "virtual_machine_extensions" {
  description = <<EOT
Map of virtual_machine_extensions, attributes below
Required:
    - name
    - publisher
    - type
    - type_handler_version
    - virtual_machine_id
Optional:
    - auto_upgrade_minor_version
    - automatic_upgrade_enabled
    - failure_suppression_enabled
    - protected_settings
    - provision_after_extensions
    - settings
    - tags
    - protected_settings_from_key_vault
EOT

  type = map(object({
    name                              = string
    publisher                         = string
    type                              = string
    type_handler_version              = string
    virtual_machine_id                = string
    auto_upgrade_minor_version        = optional(bool)
    automatic_upgrade_enabled         = optional(bool)
    failure_suppression_enabled       = optional(bool)
    protected_settings                = optional(string)
    provision_after_extensions        = optional(list(string))
    settings                          = optional(string)
    tags                              = optional(map(string))
    protected_settings_from_key_vault = optional(list(object({
            secret_url      = string
            source_vault_id = string
        })))
  }))
}
