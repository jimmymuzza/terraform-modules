resource "aws_waf_web_acl" "waf_web_acls" {
  for_each = var.waf_web_acls

  metric_name = each.value.metric_name
  name        = each.value.name
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "default_action" {
    for_each = each.value.default_action != null ? each.value.default_action : []
    content {
      type = default_action.value.type
    }
  }

  dynamic "logging_configuration" {
    for_each = each.value.logging_configuration != null ? each.value.logging_configuration : []
    content {
      log_destination = logging_configuration.value.log_destination

      dynamic "redacted_fields" {
        for_each = logging_configuration.value.redacted_fields != null ? logging_configuration.value.redacted_fields : []
        content {

          dynamic "field_to_match" {
            for_each = redacted_fields.value.field_to_match != null ? redacted_fields.value.field_to_match : []
            content {
              type = field_to_match.value.type
              data = field_to_match.value.data
            }
          }
        }
      }
    }
  }

  dynamic "rules" {
    for_each = each.value.rules != null ? each.value.rules : []
    content {
      priority = rules.value.priority
      rule_id  = rules.value.rule_id
      type     = rules.value.type

      dynamic "action" {
        for_each = rules.value.action != null ? rules.value.action : []
        content {
          type = action.value.type
        }
      }

      dynamic "override_action" {
        for_each = rules.value.override_action != null ? rules.value.override_action : []
        content {
          type = override_action.value.type
        }
      }
    }
  }
}
