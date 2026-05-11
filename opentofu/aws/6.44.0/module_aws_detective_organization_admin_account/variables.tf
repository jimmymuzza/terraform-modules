variable "detective_organization_admin_accounts" {
  description = <<EOT
Map of detective_organization_admin_accounts, attributes below
Required:
    - account_id
Optional:
    - region
EOT

  type = map(object({
    account_id = string
    region     = optional(string)
  }))
}
