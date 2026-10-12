resource "aws_workspacesweb_portal" "workspacesweb_portals" {
  for_each = var.workspacesweb_portals

  additional_encryption_context = each.value.additional_encryption_context
  authentication_type           = each.value.authentication_type
  browser_settings_arn          = each.value.browser_settings_arn
  customer_managed_key          = each.value.customer_managed_key
  display_name                  = each.value.display_name
  instance_type                 = each.value.instance_type
  max_concurrent_sessions       = each.value.max_concurrent_sessions
  region                        = each.value.region
  tags                          = each.value.tags
}
