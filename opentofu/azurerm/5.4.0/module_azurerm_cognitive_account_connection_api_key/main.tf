resource "azurerm_cognitive_account_connection_api_key" "cognitive_account_connection_api_keys" {
  for_each = var.cognitive_account_connection_api_keys

  api_key              = each.value.api_key
  category             = each.value.category
  cognitive_account_id = each.value.cognitive_account_id
  name                 = each.value.name
  metadata             = each.value.metadata
  target               = each.value.target
}
