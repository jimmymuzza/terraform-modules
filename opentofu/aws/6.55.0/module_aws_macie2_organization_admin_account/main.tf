resource "aws_macie2_organization_admin_account" "macie2_organization_admin_accounts" {
  for_each = var.macie2_organization_admin_accounts

  admin_account_id = each.value.admin_account_id
  region           = each.value.region
}
