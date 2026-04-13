resource "aws_iam_account_password_policy" "iam_account_password_policies" {
  for_each = var.iam_account_password_policies

  allow_users_to_change_password = each.value.allow_users_to_change_password
  hard_expiry                    = each.value.hard_expiry
  max_password_age               = each.value.max_password_age
  minimum_password_length        = each.value.minimum_password_length
  password_reuse_prevention      = each.value.password_reuse_prevention
  require_lowercase_characters   = each.value.require_lowercase_characters
  require_numbers                = each.value.require_numbers
  require_symbols                = each.value.require_symbols
  require_uppercase_characters   = each.value.require_uppercase_characters
}
