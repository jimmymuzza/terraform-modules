resource "aws_grafana_workspace_api_key" "grafana_workspace_api_keys" {
  for_each = var.grafana_workspace_api_keys

  key_name        = each.value.key_name
  key_role        = each.value.key_role
  seconds_to_live = each.value.seconds_to_live
  workspace_id    = each.value.workspace_id
  region          = each.value.region
}
