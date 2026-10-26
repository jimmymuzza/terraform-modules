resource "aws_prometheus_resource_policy" "prometheus_resource_policies" {
  for_each = var.prometheus_resource_policies

  policy_document = each.value.policy_document
  workspace_id    = each.value.workspace_id
  region          = each.value.region
  revision_id     = each.value.revision_id
}
