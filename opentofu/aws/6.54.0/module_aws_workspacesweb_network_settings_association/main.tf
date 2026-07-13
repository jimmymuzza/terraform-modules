resource "aws_workspacesweb_network_settings_association" "workspacesweb_network_settings_associations" {
  for_each = var.workspacesweb_network_settings_associations

  network_settings_arn = each.value.network_settings_arn
  portal_arn           = each.value.portal_arn
  region               = each.value.region
}
