resource "aws_apigatewayv2_integration" "apigatewayv2_integrations" {
  for_each = var.apigatewayv2_integrations

  api_id                        = each.value.api_id
  integration_type              = each.value.integration_type
  connection_id                 = each.value.connection_id
  connection_type               = each.value.connection_type
  content_handling_strategy     = each.value.content_handling_strategy
  credentials_arn               = each.value.credentials_arn
  description                   = each.value.description
  integration_method            = each.value.integration_method
  integration_subtype           = each.value.integration_subtype
  integration_uri               = each.value.integration_uri
  passthrough_behavior          = each.value.passthrough_behavior
  payload_format_version        = each.value.payload_format_version
  region                        = each.value.region
  request_parameters            = each.value.request_parameters
  request_templates             = each.value.request_templates
  template_selection_expression = each.value.template_selection_expression
  timeout_milliseconds          = each.value.timeout_milliseconds

  dynamic "response_parameters" {
    for_each = each.value.response_parameters != null ? each.value.response_parameters : []
    content {
      mappings    = response_parameters.value.mappings
      status_code = response_parameters.value.status_code
    }
  }

  dynamic "tls_config" {
    for_each = each.value.tls_config != null ? each.value.tls_config : []
    content {
      server_name_to_verify = tls_config.value.server_name_to_verify
    }
  }
}
