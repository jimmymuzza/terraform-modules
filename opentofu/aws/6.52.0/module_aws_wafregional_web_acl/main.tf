resource "aws_wafregional_web_acl" "wafregional_web_acls" {
  for_each = var.wafregional_web_acls

  metric_name = each.value.metric_name
  name        = each.value.name
  region      = each.value.region
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

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      priority = rule.value.priority
      rule_id  = rule.value.rule_id
      type     = rule.value.type

      dynamic "action" {
        for_each = rule.value.action != null ? rule.value.action : []
        content {
          type = action.value.type
        }
      }

      dynamic "override_action" {
        for_each = rule.value.override_action != null ? rule.value.override_action : []
        content {
          type = override_action.value.type
        }
      }
    }
  }
}
