resource "aws_observabilityadmin_telemetry_rule" "observabilityadmin_telemetry_rules" {
  for_each = var.observabilityadmin_telemetry_rules

  rule_name = each.value.rule_name
  region    = each.value.region
  tags      = each.value.tags

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      telemetry_type = rule.value.telemetry_type
      resource_type  = rule.value.resource_type
    }
  }
}
