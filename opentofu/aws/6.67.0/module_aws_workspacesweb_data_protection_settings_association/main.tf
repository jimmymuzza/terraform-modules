resource "aws_workspacesweb_data_protection_settings_association" "workspacesweb_data_protection_settings_associations" {
  for_each = var.workspacesweb_data_protection_settings_associations

  data_protection_settings_arn = each.value.data_protection_settings_arn
  portal_arn                   = each.value.portal_arn
  region                       = each.value.region
}
