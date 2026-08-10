variable "vpc_ipam_organization_admin_accounts" {
  description = <<EOT
Map of vpc_ipam_organization_admin_accounts, attributes below
Required:
    - delegated_admin_account_id
EOT

  type = map(object({
    delegated_admin_account_id = string
  }))
}
