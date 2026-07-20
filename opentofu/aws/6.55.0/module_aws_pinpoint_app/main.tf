resource "aws_pinpoint_app" "pinpoint_apps" {
  for_each = var.pinpoint_apps

  name        = each.value.name
  name_prefix = each.value.name_prefix
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "campaign_hook" {
    for_each = each.value.campaign_hook != null ? each.value.campaign_hook : []
    content {
      lambda_function_name = campaign_hook.value.lambda_function_name
      mode                 = campaign_hook.value.mode
      web_url              = campaign_hook.value.web_url
    }
  }

  dynamic "limits" {
    for_each = each.value.limits != null ? each.value.limits : []
    content {
      daily               = limits.value.daily
      maximum_duration    = limits.value.maximum_duration
      messages_per_second = limits.value.messages_per_second
      total               = limits.value.total
    }
  }

  dynamic "quiet_time" {
    for_each = each.value.quiet_time != null ? each.value.quiet_time : []
    content {
      end   = quiet_time.value.end
      start = quiet_time.value.start
    }
  }
}
