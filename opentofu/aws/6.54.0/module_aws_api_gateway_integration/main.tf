resource "aws_api_gateway_integration" "api_gateway_integrations" {
  for_each = var.api_gateway_integrations

  http_method             = each.value.http_method
  resource_id             = each.value.resource_id
  rest_api_id             = each.value.rest_api_id
  type                    = each.value.type
  cache_key_parameters    = each.value.cache_key_parameters
  cache_namespace         = each.value.cache_namespace
  connection_id           = each.value.connection_id
  connection_type         = each.value.connection_type
  content_handling        = each.value.content_handling
  credentials             = each.value.credentials
  integration_http_method = each.value.integration_http_method
  integration_target      = each.value.integration_target
  passthrough_behavior    = each.value.passthrough_behavior
  region                  = each.value.region
  request_parameters      = each.value.request_parameters
  request_templates       = each.value.request_templates
  response_transfer_mode  = each.value.response_transfer_mode
  timeout_milliseconds    = each.value.timeout_milliseconds
  uri                     = each.value.uri

  dynamic "tls_config" {
    for_each = each.value.tls_config != null ? each.value.tls_config : []
    content {
      insecure_skip_verification = tls_config.value.insecure_skip_verification
    }
  }
}
