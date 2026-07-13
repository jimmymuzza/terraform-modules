resource "aws_workspacesweb_user_settings_association" "workspacesweb_user_settings_associations" {
  for_each = var.workspacesweb_user_settings_associations

  portal_arn        = each.value.portal_arn
  user_settings_arn = each.value.user_settings_arn
  region            = each.value.region
}
