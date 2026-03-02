resource "azurerm_cognitive_account_project" "cognitive_account_projects" {
  for_each = var.cognitive_account_projects

  cognitive_account_id = each.value.cognitive_account_id
  location             = each.value.location
  name                 = each.value.name
  description          = each.value.description
  display_name         = each.value.display_name
  tags                 = each.value.tags

  dynamic "identity" {
    for_each = each.value.identity != null ? each.value.identity : []
    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
}
