resource "aws_prometheus_alert_manager_definition" "prometheus_alert_manager_definitions" {
  for_each = var.prometheus_alert_manager_definitions

  definition   = each.value.definition
  workspace_id = each.value.workspace_id
  region       = each.value.region
}
