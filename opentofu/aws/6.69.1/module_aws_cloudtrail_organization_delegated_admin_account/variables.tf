variable "cloudtrail_organization_delegated_admin_accounts" {
  description = <<EOT
Map of cloudtrail_organization_delegated_admin_accounts, attributes below
Required:
    - account_id
EOT

  type = map(object({
    account_id = string
  }))
}
