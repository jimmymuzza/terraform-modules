resource "aws_wafv2_web_acl_logging_configuration" "wafv2_web_acl_logging_configurations" {
  for_each = var.wafv2_web_acl_logging_configurations

  log_destination_configs = each.value.log_destination_configs
  resource_arn            = each.value.resource_arn
  region                  = each.value.region

  dynamic "logging_filter" {
    for_each = each.value.logging_filter != null ? each.value.logging_filter : []
    content {
      default_behavior = logging_filter.value.default_behavior

      dynamic "filter" {
        for_each = logging_filter.value.filter != null ? logging_filter.value.filter : []
        content {
          behavior    = filter.value.behavior
          requirement = filter.value.requirement

          dynamic "condition" {
            for_each = filter.value.condition != null ? filter.value.condition : []
            content {

              dynamic "action_condition" {
                for_each = condition.value.action_condition != null ? condition.value.action_condition : []
                content {
                  action = action_condition.value.action
                }
              }

              dynamic "label_name_condition" {
                for_each = condition.value.label_name_condition != null ? condition.value.label_name_condition : []
                content {
                  label_name = label_name_condition.value.label_name
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "redacted_fields" {
    for_each = each.value.redacted_fields != null ? each.value.redacted_fields : []
    content {

      dynamic "method" {
        for_each = redacted_fields.value.method != null ? redacted_fields.value.method : []
        content {
        }
      }

      dynamic "query_string" {
        for_each = redacted_fields.value.query_string != null ? redacted_fields.value.query_string : []
        content {
        }
      }

      dynamic "single_header" {
        for_each = redacted_fields.value.single_header != null ? redacted_fields.value.single_header : []
        content {
          name = single_header.value.name
        }
      }

      dynamic "uri_path" {
        for_each = redacted_fields.value.uri_path != null ? redacted_fields.value.uri_path : []
        content {
        }
      }
    }
  }
}
