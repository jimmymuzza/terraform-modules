variable "automation_variable_objects" {
  description = <<EOT
Map of automation_variable_objects, attributes below
Required:
    - automation_account_name
    - name
    - resource_group_name
Optional:
    - description
    - encrypted
    - value
EOT

  type = map(object({
    automation_account_name = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
    encrypted               = optional(bool)
    value                   = optional(string)
  }))
}
