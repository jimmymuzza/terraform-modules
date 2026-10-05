variable "automation_certificates" {
  description = <<EOT
Map of automation_certificates, attributes below
Required:
    - automation_account_name
    - base64
    - name
    - resource_group_name
Optional:
    - description
    - exportable
EOT

  type = map(object({
    automation_account_name = string
    base64                  = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
    exportable              = optional(bool)
  }))
}
