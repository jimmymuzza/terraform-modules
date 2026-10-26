variable "automation_connection_certificates" {
  description = <<EOT
Map of automation_connection_certificates, attributes below
Required:
    - automation_account_name
    - automation_certificate_name
    - name
    - resource_group_name
    - subscription_id
Optional:
    - description
EOT

  type = map(object({
    automation_account_name     = string
    automation_certificate_name = string
    name                        = string
    resource_group_name         = string
    subscription_id             = string
    description                 = optional(string)
  }))
}
