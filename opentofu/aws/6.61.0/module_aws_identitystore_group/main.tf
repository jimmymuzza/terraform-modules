resource "aws_identitystore_group" "identitystore_groups" {
  for_each = var.identitystore_groups

  display_name      = each.value.display_name
  identity_store_id = each.value.identity_store_id
  description       = each.value.description
  region            = each.value.region
}
