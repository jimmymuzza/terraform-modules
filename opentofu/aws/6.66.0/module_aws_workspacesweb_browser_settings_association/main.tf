resource "aws_workspacesweb_browser_settings_association" "workspacesweb_browser_settings_associations" {
  for_each = var.workspacesweb_browser_settings_associations

  browser_settings_arn = each.value.browser_settings_arn
  portal_arn           = each.value.portal_arn
  region               = each.value.region
}
