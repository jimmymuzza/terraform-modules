resource "aws_securityhub_organization_admin_account" "securityhub_organization_admin_accounts" {
  for_each = var.securityhub_organization_admin_accounts

  admin_account_id = each.value.admin_account_id
  region           = each.value.region
}
