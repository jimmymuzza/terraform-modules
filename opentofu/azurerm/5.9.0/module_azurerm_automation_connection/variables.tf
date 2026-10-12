variable "automation_connections" {
  description = <<EOT
Map of automation_connections, attributes below
Required:
    - automation_account_name
    - name
    - resource_group_name
    - type
    - values
Optional:
    - description
EOT

  type = map(object({
    automation_account_name = string
    name                    = string
    resource_group_name     = string
    type                    = string
    values                  = map(string)
    description             = optional(string)
  }))
}
