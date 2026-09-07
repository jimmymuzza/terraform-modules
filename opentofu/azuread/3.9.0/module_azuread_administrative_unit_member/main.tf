resource "azuread_administrative_unit_member" "administrative_unit_members" {
  for_each = var.administrative_unit_members

  administrative_unit_object_id = each.value.administrative_unit_object_id
  member_object_id              = each.value.member_object_id
}
