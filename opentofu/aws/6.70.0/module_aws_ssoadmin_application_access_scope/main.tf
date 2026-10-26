resource "aws_ssoadmin_application_access_scope" "ssoadmin_application_access_scopes" {
  for_each = var.ssoadmin_application_access_scopes

  application_arn    = each.value.application_arn
  scope              = each.value.scope
  authorized_targets = each.value.authorized_targets
  region             = each.value.region
}
