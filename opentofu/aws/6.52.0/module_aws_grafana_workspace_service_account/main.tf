resource "aws_grafana_workspace_service_account" "grafana_workspace_service_accounts" {
  for_each = var.grafana_workspace_service_accounts

  grafana_role = each.value.grafana_role
  name         = each.value.name
  workspace_id = each.value.workspace_id
  region       = each.value.region
}
