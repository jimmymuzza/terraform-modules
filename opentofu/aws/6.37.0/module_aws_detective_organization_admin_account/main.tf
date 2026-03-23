resource "aws_detective_organization_admin_account" "detective_organization_admin_accounts" {
  for_each = var.detective_organization_admin_accounts

  account_id = each.value.account_id
  region     = each.value.region
}
