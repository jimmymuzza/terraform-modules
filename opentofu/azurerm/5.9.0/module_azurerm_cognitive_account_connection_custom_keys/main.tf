resource "azurerm_cognitive_account_connection_custom_keys" "cognitive_account_connection_custom_keys" {
  for_each = var.cognitive_account_connection_custom_keys

  category             = each.value.category
  cognitive_account_id = each.value.cognitive_account_id
  custom_keys          = each.value.custom_keys
  name                 = each.value.name
  target               = each.value.target
  metadata             = each.value.metadata
}
