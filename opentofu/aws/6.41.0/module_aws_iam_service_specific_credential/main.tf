resource "aws_iam_service_specific_credential" "iam_service_specific_credentials" {
  for_each = var.iam_service_specific_credentials

  service_name        = each.value.service_name
  user_name           = each.value.user_name
  credential_age_days = each.value.credential_age_days
  status              = each.value.status
}
