resource "aws_grafana_workspace_service_account_token" "grafana_workspace_service_account_tokens" {
  for_each = var.grafana_workspace_service_account_tokens

  name               = each.value.name
  seconds_to_live    = each.value.seconds_to_live
  service_account_id = each.value.service_account_id
  workspace_id       = each.value.workspace_id
  region             = each.value.region
}
