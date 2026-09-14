variable "logic_app_integration_account_sessions" {
  description = <<EOT
Map of logic_app_integration_account_sessions, attributes below
Required:
    - content
    - integration_account_name
    - name
    - resource_group_name
EOT

  type = map(object({
    content                  = string
    integration_account_name = string
    name                     = string
    resource_group_name      = string
  }))
}
