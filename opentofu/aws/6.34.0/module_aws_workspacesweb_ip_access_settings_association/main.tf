resource "aws_workspacesweb_ip_access_settings_association" "workspacesweb_ip_access_settings_associations" {
  for_each = var.workspacesweb_ip_access_settings_associations

  ip_access_settings_arn = each.value.ip_access_settings_arn
  portal_arn             = each.value.portal_arn
  region                 = each.value.region
}
