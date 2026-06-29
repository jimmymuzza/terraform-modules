resource "azuread_application_owner" "application_owners" {
  for_each = var.application_owners

  application_id  = each.value.application_id
  owner_object_id = each.value.owner_object_id
}
