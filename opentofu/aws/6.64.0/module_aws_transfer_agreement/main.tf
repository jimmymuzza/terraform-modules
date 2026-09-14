resource "aws_transfer_agreement" "transfer_agreements" {
  for_each = var.transfer_agreements

  access_role        = each.value.access_role
  base_directory     = each.value.base_directory
  local_profile_id   = each.value.local_profile_id
  partner_profile_id = each.value.partner_profile_id
  server_id          = each.value.server_id
  description        = each.value.description
  region             = each.value.region
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
