resource "aws_workspacesweb_user_settings" "workspacesweb_user_settings" {
  for_each = var.workspacesweb_user_settings

  copy_allowed                       = each.value.copy_allowed
  download_allowed                   = each.value.download_allowed
  paste_allowed                      = each.value.paste_allowed
  print_allowed                      = each.value.print_allowed
  upload_allowed                     = each.value.upload_allowed
  additional_encryption_context      = each.value.additional_encryption_context
  customer_managed_key               = each.value.customer_managed_key
  deep_link_allowed                  = each.value.deep_link_allowed
  disconnect_timeout_in_minutes      = each.value.disconnect_timeout_in_minutes
  idle_disconnect_timeout_in_minutes = each.value.idle_disconnect_timeout_in_minutes
  region                             = each.value.region
  tags                               = each.value.tags

  dynamic "cookie_synchronization_configuration" {
    for_each = each.value.cookie_synchronization_configuration != null ? each.value.cookie_synchronization_configuration : []
    content {

      dynamic "allowlist" {
        for_each = cookie_synchronization_configuration.value.allowlist != null ? cookie_synchronization_configuration.value.allowlist : []
        content {
          domain = allowlist.value.domain
          name   = allowlist.value.name
          path   = allowlist.value.path
        }
      }

      dynamic "blocklist" {
        for_each = cookie_synchronization_configuration.value.blocklist != null ? cookie_synchronization_configuration.value.blocklist : []
        content {
          domain = blocklist.value.domain
          name   = blocklist.value.name
          path   = blocklist.value.path
        }
      }
    }
  }

  dynamic "toolbar_configuration" {
    for_each = each.value.toolbar_configuration != null ? each.value.toolbar_configuration : []
    content {
      hidden_toolbar_items   = toolbar_configuration.value.hidden_toolbar_items
      max_display_resolution = toolbar_configuration.value.max_display_resolution
      toolbar_type           = toolbar_configuration.value.toolbar_type
      visual_mode            = toolbar_configuration.value.visual_mode
    }
  }
}
