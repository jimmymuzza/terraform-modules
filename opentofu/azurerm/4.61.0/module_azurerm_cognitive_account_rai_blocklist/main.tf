resource "azurerm_cognitive_account_rai_blocklist" "cognitive_account_rai_blocklists" {
  for_each = var.cognitive_account_rai_blocklists

  cognitive_account_id = each.value.cognitive_account_id
  name                 = each.value.name
  description          = each.value.description
}
