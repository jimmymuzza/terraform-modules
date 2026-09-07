resource "azurerm_cognitive_account_connection_entra_id" "cognitive_account_connection_entra_ids" {
  for_each = var.cognitive_account_connection_entra_ids

  category             = each.value.category
  cognitive_account_id = each.value.cognitive_account_id
  name                 = each.value.name
  target               = each.value.target
  metadata             = each.value.metadata
}
