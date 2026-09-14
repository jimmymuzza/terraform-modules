resource "aws_apigatewayv2_stage" "apigatewayv2_stages" {
  for_each = var.apigatewayv2_stages

  api_id                = each.value.api_id
  name                  = each.value.name
  auto_deploy           = each.value.auto_deploy
  client_certificate_id = each.value.client_certificate_id
  deployment_id         = each.value.deployment_id
  description           = each.value.description
  region                = each.value.region
  stage_variables       = each.value.stage_variables
  tags                  = each.value.tags
  tags_all              = each.value.tags_all

  dynamic "access_log_settings" {
    for_each = each.value.access_log_settings != null ? each.value.access_log_settings : []
    content {
      destination_arn = access_log_settings.value.destination_arn
      format          = access_log_settings.value.format
    }
  }

  dynamic "default_route_settings" {
    for_each = each.value.default_route_settings != null ? each.value.default_route_settings : []
    content {
      data_trace_enabled       = default_route_settings.value.data_trace_enabled
      detailed_metrics_enabled = default_route_settings.value.detailed_metrics_enabled
      logging_level            = default_route_settings.value.logging_level
      throttling_burst_limit   = default_route_settings.value.throttling_burst_limit
      throttling_rate_limit    = default_route_settings.value.throttling_rate_limit
    }
  }

  dynamic "route_settings" {
    for_each = each.value.route_settings != null ? each.value.route_settings : []
    content {
      route_key                = route_settings.value.route_key
      data_trace_enabled       = route_settings.value.data_trace_enabled
      detailed_metrics_enabled = route_settings.value.detailed_metrics_enabled
      logging_level            = route_settings.value.logging_level
      throttling_burst_limit   = route_settings.value.throttling_burst_limit
      throttling_rate_limit    = route_settings.value.throttling_rate_limit
    }
  }
}
