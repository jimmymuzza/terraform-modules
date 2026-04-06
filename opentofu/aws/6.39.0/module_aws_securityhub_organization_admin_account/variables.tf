variable "securityhub_organization_admin_accounts" {
  description = <<EOT
Map of securityhub_organization_admin_accounts, attributes below
Required:
    - admin_account_id
Optional:
    - region
EOT

  type = map(object({
    admin_account_id = string
    region           = optional(string)
  }))
}
