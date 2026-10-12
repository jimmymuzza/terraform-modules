resource "aws_bedrockagentcore_gateway_rule" "bedrockagentcore_gateway_rules" {
  for_each = var.bedrockagentcore_gateway_rules

  gateway_identifier = each.value.gateway_identifier
  priority           = each.value.priority
  description        = each.value.description
  region             = each.value.region

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {

      dynamic "configuration_bundle" {
        for_each = action.value.configuration_bundle != null ? action.value.configuration_bundle : []
        content {

          dynamic "static_override" {
            for_each = configuration_bundle.value.static_override != null ? configuration_bundle.value.static_override : []
            content {
              bundle_arn     = static_override.value.bundle_arn
              bundle_version = static_override.value.bundle_version
            }
          }

          dynamic "weighted_override" {
            for_each = configuration_bundle.value.weighted_override != null ? configuration_bundle.value.weighted_override : []
            content {

              dynamic "traffic_split" {
                for_each = weighted_override.value.traffic_split != null ? weighted_override.value.traffic_split : []
                content {
                  name        = traffic_split.value.name
                  weight      = traffic_split.value.weight
                  description = traffic_split.value.description
                  metadata    = traffic_split.value.metadata

                  dynamic "configuration_bundle" {
                    for_each = traffic_split.value.configuration_bundle != null ? traffic_split.value.configuration_bundle : []
                    content {
                      bundle_arn     = configuration_bundle.value.bundle_arn
                      bundle_version = configuration_bundle.value.bundle_version
                    }
                  }
                }
              }
            }
          }
        }
      }

      dynamic "route_to_target" {
        for_each = action.value.route_to_target != null ? action.value.route_to_target : []
        content {

          dynamic "static_route" {
            for_each = route_to_target.value.static_route != null ? route_to_target.value.static_route : []
            content {
              target_name = static_route.value.target_name
            }
          }

          dynamic "weighted_route" {
            for_each = route_to_target.value.weighted_route != null ? route_to_target.value.weighted_route : []
            content {

              dynamic "traffic_split" {
                for_each = weighted_route.value.traffic_split != null ? weighted_route.value.traffic_split : []
                content {
                  name        = traffic_split.value.name
                  target_name = traffic_split.value.target_name
                  weight      = traffic_split.value.weight
                  description = traffic_split.value.description
                  metadata    = traffic_split.value.metadata
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "condition" {
    for_each = each.value.condition != null ? each.value.condition : []
    content {

      dynamic "match_paths" {
        for_each = condition.value.match_paths != null ? condition.value.match_paths : []
        content {
          any_of = match_paths.value.any_of
        }
      }

      dynamic "match_principals" {
        for_each = condition.value.match_principals != null ? condition.value.match_principals : []
        content {

          dynamic "any_of" {
            for_each = match_principals.value.any_of != null ? match_principals.value.any_of : []
            content {

              dynamic "iam_principal" {
                for_each = any_of.value.iam_principal != null ? any_of.value.iam_principal : []
                content {
                  arn      = iam_principal.value.arn
                  operator = iam_principal.value.operator
                }
              }
            }
          }
        }
      }
    }
  }
}
