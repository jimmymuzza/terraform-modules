resource "aws_fms_admin_account" "fms_admin_accounts" {
  for_each = var.fms_admin_accounts

  account_id = each.value.account_id
}
