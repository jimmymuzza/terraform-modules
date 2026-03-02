variable "automation_connection_service_principals" {
  description = <<EOT
Map of automation_connection_service_principals, attributes below
Required:
    - application_id
    - automation_account_name
    - certificate_thumbprint
    - name
    - resource_group_name
    - subscription_id
    - tenant_id
Optional:
    - description
EOT

  type = map(object({
    application_id          = string
    automation_account_name = string
    certificate_thumbprint  = string
    name                    = string
    resource_group_name     = string
    subscription_id         = string
    tenant_id               = string
    description             = optional(string)
  }))
}
