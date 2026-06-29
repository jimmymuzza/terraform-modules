resource "aws_networkfirewall_resource_policy" "networkfirewall_resource_policies" {
  for_each = var.networkfirewall_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
