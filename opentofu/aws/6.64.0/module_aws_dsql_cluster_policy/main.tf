resource "aws_dsql_cluster_policy" "dsql_cluster_policies" {
  for_each = var.dsql_cluster_policies

  identifier                         = each.value.identifier
  policy                             = each.value.policy
  bypass_policy_lockout_safety_check = each.value.bypass_policy_lockout_safety_check
  region                             = each.value.region
}
