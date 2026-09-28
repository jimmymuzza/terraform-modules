resource "aws_cloudtrail_organization_delegated_admin_account" "cloudtrail_organization_delegated_admin_accounts" {
  for_each = var.cloudtrail_organization_delegated_admin_accounts

  account_id = each.value.account_id
}
