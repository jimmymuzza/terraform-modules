resource "aws_inspector2_delegated_admin_account" "inspector2_delegated_admin_accounts" {
  for_each = var.inspector2_delegated_admin_accounts

  account_id = each.value.account_id
  region     = each.value.region
}
