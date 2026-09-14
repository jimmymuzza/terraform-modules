resource "aws_rum_app_monitor" "rum_app_monitors" {
  for_each = var.rum_app_monitors

  name           = each.value.name
  cw_log_enabled = each.value.cw_log_enabled
  domain         = each.value.domain
  domain_list    = each.value.domain_list
  region         = each.value.region
  tags           = each.value.tags
  tags_all       = each.value.tags_all

  dynamic "app_monitor_configuration" {
    for_each = each.value.app_monitor_configuration != null ? each.value.app_monitor_configuration : []
    content {
      allow_cookies       = app_monitor_configuration.value.allow_cookies
      enable_xray         = app_monitor_configuration.value.enable_xray
      excluded_pages      = app_monitor_configuration.value.excluded_pages
      favorite_pages      = app_monitor_configuration.value.favorite_pages
      guest_role_arn      = app_monitor_configuration.value.guest_role_arn
      identity_pool_id    = app_monitor_configuration.value.identity_pool_id
      included_pages      = app_monitor_configuration.value.included_pages
      session_sample_rate = app_monitor_configuration.value.session_sample_rate
      telemetries         = app_monitor_configuration.value.telemetries
    }
  }

  dynamic "custom_events" {
    for_each = each.value.custom_events != null ? each.value.custom_events : []
    content {
      status = custom_events.value.status
    }
  }
}
