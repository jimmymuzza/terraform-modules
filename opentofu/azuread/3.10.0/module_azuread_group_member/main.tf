resource "azuread_group_member" "group_members" {
  for_each = var.group_members

  group_object_id  = each.value.group_object_id
  member_object_id = each.value.member_object_id
}
