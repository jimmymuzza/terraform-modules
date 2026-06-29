variable "automation_credentials" {
  description = <<EOT
Map of automation_credentials, attributes below
Required:
    - automation_account_name
    - name
    - password
    - resource_group_name
    - username
Optional:
    - description
EOT

  type = map(object({
    automation_account_name = string
    name                    = string
    password                = string
    resource_group_name     = string
    username                = string
    description             = optional(string)
  }))
}
