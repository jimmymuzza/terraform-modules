variable "auditmanager_organization_admin_account_registrations" {
  description = <<EOT
Map of auditmanager_organization_admin_account_registrations, attributes below
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
