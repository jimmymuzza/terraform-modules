resource "aws_api_gateway_usage_plan" "api_gateway_usage_plans" {
  for_each = var.api_gateway_usage_plans

  name         = each.value.name
  description  = each.value.description
  product_code = each.value.product_code
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all

  dynamic "api_stages" {
    for_each = each.value.api_stages != null ? each.value.api_stages : []
    content {
      api_id = api_stages.value.api_id
      stage  = api_stages.value.stage

      dynamic "throttle" {
        for_each = api_stages.value.throttle != null ? api_stages.value.throttle : []
        content {
          path        = throttle.value.path
          burst_limit = throttle.value.burst_limit
          rate_limit  = throttle.value.rate_limit
        }
      }
    }
  }

  dynamic "quota_settings" {
    for_each = each.value.quota_settings != null ? each.value.quota_settings : []
    content {
      limit  = quota_settings.value.limit
      period = quota_settings.value.period
      offset = quota_settings.value.offset
    }
  }

  dynamic "throttle_settings" {
    for_each = each.value.throttle_settings != null ? each.value.throttle_settings : []
    content {
      burst_limit = throttle_settings.value.burst_limit
      rate_limit  = throttle_settings.value.rate_limit
    }
  }
}
