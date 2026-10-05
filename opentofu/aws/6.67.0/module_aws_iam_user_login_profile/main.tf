resource "aws_iam_user_login_profile" "iam_user_login_profiles" {
  for_each = var.iam_user_login_profiles

  user                    = each.value.user
  password_length         = each.value.password_length
  password_reset_required = each.value.password_reset_required
  pgp_key                 = each.value.pgp_key
}
