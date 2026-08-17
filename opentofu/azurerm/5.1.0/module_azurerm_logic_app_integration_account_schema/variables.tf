variable "logic_app_integration_account_schemas" {
  description = <<EOT
Map of logic_app_integration_account_schemas, attributes below
Required:
    - content
    - integration_account_name
    - name
    - resource_group_name
Optional:
    - file_name
    - metadata
EOT

  type = map(object({
    content                  = string
    integration_account_name = string
    name                     = string
    resource_group_name      = string
    file_name                = optional(string)
    metadata                 = optional(string)
  }))
}
