resource "azurerm_cognitive_account_connection_account_managed_identity" "cognitive_account_connection_account_managed_identities" {
  for_each = var.cognitive_account_connection_account_managed_identities

  category             = each.value.category
  cognitive_account_id = each.value.cognitive_account_id
  metadata             = each.value.metadata
  name                 = each.value.name
  target               = each.value.target
}
