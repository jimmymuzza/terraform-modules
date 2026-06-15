resource "aws_guardduty_organization_admin_account" "guardduty_organization_admin_accounts" {
  for_each = var.guardduty_organization_admin_accounts

  admin_account_id = each.value.admin_account_id
  region           = each.value.region
}
