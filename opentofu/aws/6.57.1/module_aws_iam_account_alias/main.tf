resource "aws_iam_account_alias" "iam_account_alias" {
  for_each = var.iam_account_alias

  account_alias = each.value.account_alias
}
