resource "aws_wafregional_rule_group" "wafregional_rule_groups" {
  for_each = var.wafregional_rule_groups

  metric_name = each.value.metric_name
  name        = each.value.name
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "activated_rule" {
    for_each = each.value.activated_rule != null ? each.value.activated_rule : []
    content {
      priority = activated_rule.value.priority
      rule_id  = activated_rule.value.rule_id
      type     = activated_rule.value.type

      dynamic "action" {
        for_each = activated_rule.value.action != null ? activated_rule.value.action : []
        content {
          type = action.value.type
        }
      }
    }
  }
}
