resource "aws_vpclattice_auth_policy" "vpclattice_auth_policies" {
  for_each = var.vpclattice_auth_policies

  policy              = each.value.policy
  resource_identifier = each.value.resource_identifier
  region              = each.value.region
  state               = each.value.state
}
