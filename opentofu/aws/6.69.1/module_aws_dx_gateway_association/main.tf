resource "aws_dx_gateway_association" "dx_gateway_associations" {
  for_each = var.dx_gateway_associations

  dx_gateway_id                       = each.value.dx_gateway_id
  allowed_prefixes                    = each.value.allowed_prefixes
  associated_gateway_id               = each.value.associated_gateway_id
  associated_gateway_owner_account_id = each.value.associated_gateway_owner_account_id
  proposal_id                         = each.value.proposal_id
  region                              = each.value.region
}
