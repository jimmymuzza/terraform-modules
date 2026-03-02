resource "aws_grafana_role_association" "grafana_role_associations" {
  for_each = var.grafana_role_associations

  role         = each.value.role
  workspace_id = each.value.workspace_id
  group_ids    = each.value.group_ids
  region       = each.value.region
  user_ids     = each.value.user_ids
}
