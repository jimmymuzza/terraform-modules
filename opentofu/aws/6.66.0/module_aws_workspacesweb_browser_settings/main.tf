resource "aws_workspacesweb_browser_settings" "workspacesweb_browser_settings" {
  for_each = var.workspacesweb_browser_settings

  browser_policy                = each.value.browser_policy
  additional_encryption_context = each.value.additional_encryption_context
  customer_managed_key          = each.value.customer_managed_key
  region                        = each.value.region
  tags                          = each.value.tags
}
