resource "aws_identitystore_group_membership" "identitystore_group_memberships" {
  for_each = var.identitystore_group_memberships

  group_id          = each.value.group_id
  identity_store_id = each.value.identity_store_id
  member_id         = each.value.member_id
  region            = each.value.region
}
