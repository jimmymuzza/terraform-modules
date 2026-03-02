resource "aws_workspacesweb_ip_access_settings" "workspacesweb_ip_access_settings" {
  for_each = var.workspacesweb_ip_access_settings

  display_name                  = each.value.display_name
  additional_encryption_context = each.value.additional_encryption_context
  customer_managed_key          = each.value.customer_managed_key
  description                   = each.value.description
  region                        = each.value.region
  tags                          = each.value.tags

  dynamic "ip_rule" {
    for_each = each.value.ip_rule != null ? each.value.ip_rule : []
    content {
      ip_range    = ip_rule.value.ip_range
      description = ip_rule.value.description
    }
  }
}
