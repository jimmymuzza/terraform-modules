resource "aws_vpclattice_resource_policy" "vpclattice_resource_policies" {
  for_each = var.vpclattice_resource_policies

  policy       = each.value.policy
  resource_arn = each.value.resource_arn
  region       = each.value.region
}
