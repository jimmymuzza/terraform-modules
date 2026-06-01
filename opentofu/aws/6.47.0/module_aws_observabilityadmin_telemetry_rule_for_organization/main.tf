resource "aws_observabilityadmin_telemetry_rule_for_organization" "observabilityadmin_telemetry_rule_for_organizations" {
  for_each = var.observabilityadmin_telemetry_rule_for_organizations

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
