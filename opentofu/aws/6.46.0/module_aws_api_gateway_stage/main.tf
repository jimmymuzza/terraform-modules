resource "aws_api_gateway_stage" "api_gateway_stages" {
  for_each = var.api_gateway_stages

  deployment_id         = each.value.deployment_id
  rest_api_id           = each.value.rest_api_id
  stage_name            = each.value.stage_name
  cache_cluster_enabled = each.value.cache_cluster_enabled
  cache_cluster_size    = each.value.cache_cluster_size
  client_certificate_id = each.value.client_certificate_id
  description           = each.value.description
  documentation_version = each.value.documentation_version
  region                = each.value.region
  tags                  = each.value.tags
  tags_all              = each.value.tags_all
  variables             = each.value.variables
  xray_tracing_enabled  = each.value.xray_tracing_enabled

  dynamic "access_log_settings" {
    for_each = each.value.access_log_settings != null ? each.value.access_log_settings : []
    content {
      destination_arn = access_log_settings.value.destination_arn
      format          = access_log_settings.value.format
    }
  }

  dynamic "canary_settings" {
    for_each = each.value.canary_settings != null ? each.value.canary_settings : []
    content {
      deployment_id            = canary_settings.value.deployment_id
      percent_traffic          = canary_settings.value.percent_traffic
      stage_variable_overrides = canary_settings.value.stage_variable_overrides
      use_stage_cache          = canary_settings.value.use_stage_cache
    }
  }
}
