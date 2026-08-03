variable "stack_hci_extensions" {
  description = <<EOT
Map of stack_hci_extensions, attributes below
Required:
    - arc_setting_id
    - name
    - publisher
    - type
Optional:
    - auto_upgrade_minor_version_enabled
    - automatic_upgrade_enabled
    - protected_settings
    - settings
    - type_handler_version
EOT

  type = map(object({
    arc_setting_id                     = string
    name                               = string
    publisher                          = string
    type                               = string
    auto_upgrade_minor_version_enabled = optional(bool)
    automatic_upgrade_enabled          = optional(bool)
    protected_settings                 = optional(string)
    settings                           = optional(string)
    type_handler_version               = optional(string)
  }))
}
