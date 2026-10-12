resource "aws_apigatewayv2_routing_rule" "apigatewayv2_routing_rules" {
  for_each = var.apigatewayv2_routing_rules

  domain_name = each.value.domain_name
  priority    = each.value.priority
  region      = each.value.region

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {

      dynamic "invoke_api" {
        for_each = action.value.invoke_api != null ? action.value.invoke_api : []
        content {
          api_id          = invoke_api.value.api_id
          stage           = invoke_api.value.stage
          strip_base_path = invoke_api.value.strip_base_path
        }
      }
    }
  }

  dynamic "condition" {
    for_each = each.value.condition != null ? each.value.condition : []
    content {

      dynamic "match_base_paths" {
        for_each = condition.value.match_base_paths != null ? condition.value.match_base_paths : []
        content {
          any_of = match_base_paths.value.any_of
        }
      }

      dynamic "match_headers" {
        for_each = condition.value.match_headers != null ? condition.value.match_headers : []
        content {

          dynamic "any_of" {
            for_each = match_headers.value.any_of != null ? match_headers.value.any_of : []
            content {
              header     = any_of.value.header
              value_glob = any_of.value.value_glob
            }
          }
        }
      }
    }
  }
}
