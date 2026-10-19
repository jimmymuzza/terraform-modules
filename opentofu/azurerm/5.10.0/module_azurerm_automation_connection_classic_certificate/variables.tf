variable "automation_connection_classic_certificates" {
  description = <<EOT
Map of automation_connection_classic_certificates, attributes below
Required:
    - automation_account_name
    - certificate_asset_name
    - name
    - resource_group_name
    - subscription_id
    - subscription_name
Optional:
    - description
EOT

  type = map(object({
    automation_account_name = string
    certificate_asset_name  = string
    name                    = string
    resource_group_name     = string
    subscription_id         = string
    subscription_name       = string
    description             = optional(string)
  }))
}
