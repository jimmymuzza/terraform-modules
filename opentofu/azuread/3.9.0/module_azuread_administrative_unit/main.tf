resource "azuread_administrative_unit" "administrative_units" {
  for_each = var.administrative_units

  display_name              = each.value.display_name
  description               = each.value.description
  hidden_membership_enabled = each.value.hidden_membership_enabled
  members                   = each.value.members
  prevent_duplicate_names   = each.value.prevent_duplicate_names
}
