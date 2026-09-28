resource "aws_dx_gateway_association_proposal" "dx_gateway_association_proposals" {
  for_each = var.dx_gateway_association_proposals

  associated_gateway_id       = each.value.associated_gateway_id
  dx_gateway_id               = each.value.dx_gateway_id
  dx_gateway_owner_account_id = each.value.dx_gateway_owner_account_id
  allowed_prefixes            = each.value.allowed_prefixes
  region                      = each.value.region
}
