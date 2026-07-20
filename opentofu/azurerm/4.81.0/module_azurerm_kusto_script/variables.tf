variable "kusto_scripts" {
  description = <<EOT
Map of kusto_scripts, attributes below
Required:
    - database_id
    - name
Optional:
    - continue_on_errors_enabled
    - force_an_update_when_value_changed
    - principal_permissions_action
    - sas_token
    - script_content
    - script_level
    - url
EOT

  type = map(object({
    database_id                        = string
    name                               = string
    continue_on_errors_enabled         = optional(bool)
    force_an_update_when_value_changed = optional(string)
    principal_permissions_action       = optional(string)
    sas_token                          = optional(string)
    script_content                     = optional(string)
    script_level                       = optional(string)
    url                                = optional(string)
  }))
}
