resource "azurerm_cognitive_account_connection_account_key" "cognitive_account_connection_account_keys" {
  for_each = var.cognitive_account_connection_account_keys

  account_key          = each.value.account_key
  category             = each.value.category
  cognitive_account_id = each.value.cognitive_account_id
  metadata             = each.value.metadata
  name                 = each.value.name
  target               = each.value.target
}
