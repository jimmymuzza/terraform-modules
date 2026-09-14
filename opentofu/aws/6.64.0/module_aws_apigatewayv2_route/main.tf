resource "aws_apigatewayv2_route" "apigatewayv2_routes" {
  for_each = var.apigatewayv2_routes

  api_id                              = each.value.api_id
  route_key                           = each.value.route_key
  api_key_required                    = each.value.api_key_required
  authorization_scopes                = each.value.authorization_scopes
  authorization_type                  = each.value.authorization_type
  authorizer_id                       = each.value.authorizer_id
  model_selection_expression          = each.value.model_selection_expression
  operation_name                      = each.value.operation_name
  region                              = each.value.region
  request_models                      = each.value.request_models
  route_response_selection_expression = each.value.route_response_selection_expression
  target                              = each.value.target

  dynamic "request_parameter" {
    for_each = each.value.request_parameter != null ? each.value.request_parameter : []
    content {
      request_parameter_key = request_parameter.value.request_parameter_key
      required              = request_parameter.value.required
    }
  }
}
