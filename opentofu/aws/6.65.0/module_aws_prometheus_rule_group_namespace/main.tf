resource "aws_prometheus_rule_group_namespace" "prometheus_rule_group_namespaces" {
  for_each = var.prometheus_rule_group_namespaces

  data         = each.value.data
  name         = each.value.name
  workspace_id = each.value.workspace_id
  region       = each.value.region
  tags         = each.value.tags
  tags_all     = each.value.tags_all
}
