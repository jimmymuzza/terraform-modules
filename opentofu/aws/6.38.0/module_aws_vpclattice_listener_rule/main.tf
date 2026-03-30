resource "aws_vpclattice_listener_rule" "vpclattice_listener_rules" {
  for_each = var.vpclattice_listener_rules

  listener_identifier = each.value.listener_identifier
  name                = each.value.name
  priority            = each.value.priority
  service_identifier  = each.value.service_identifier
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "action" {
    for_each = each.value.action != null ? each.value.action : []
    content {

      dynamic "fixed_response" {
        for_each = action.value.fixed_response != null ? action.value.fixed_response : []
        content {
          status_code = fixed_response.value.status_code
        }
      }

      dynamic "forward" {
        for_each = action.value.forward != null ? action.value.forward : []
        content {

          dynamic "target_groups" {
            for_each = forward.value.target_groups != null ? forward.value.target_groups : []
            content {
              target_group_identifier = target_groups.value.target_group_identifier
              weight                  = target_groups.value.weight
            }
          }
        }
      }
    }
  }

  dynamic "match" {
    for_each = each.value.match != null ? each.value.match : []
    content {

      dynamic "http_match" {
        for_each = match.value.http_match != null ? match.value.http_match : []
        content {
          method = http_match.value.method

          dynamic "header_matches" {
            for_each = http_match.value.header_matches != null ? http_match.value.header_matches : []
            content {
              name           = header_matches.value.name
              case_sensitive = header_matches.value.case_sensitive

              dynamic "match" {
                for_each = header_matches.value.match != null ? header_matches.value.match : []
                content {
                  contains = match.value.contains
                  exact    = match.value.exact
                  prefix   = match.value.prefix
                }
              }
            }
          }

          dynamic "path_match" {
            for_each = http_match.value.path_match != null ? http_match.value.path_match : []
            content {
              case_sensitive = path_match.value.case_sensitive

              dynamic "match" {
                for_each = path_match.value.match != null ? path_match.value.match : []
                content {
                  exact  = match.value.exact
                  prefix = match.value.prefix
                }
              }
            }
          }
        }
      }
    }
  }
}
