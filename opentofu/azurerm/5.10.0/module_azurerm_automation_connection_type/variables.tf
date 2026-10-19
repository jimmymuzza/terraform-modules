variable "automation_connection_types" {
  description = <<EOT
Map of automation_connection_types, attributes below
Required:
    - automation_account_name
    - name
    - resource_group_name
    - field
Optional:
    - is_global
EOT

  type = map(object({
    automation_account_name = string
    name                    = string
    resource_group_name     = string
    is_global               = optional(bool)
    field                   = list(object({
            name         = string
            type         = string
            is_encrypted = optional(bool)
            is_optional  = optional(bool)
        }))
  }))
}
