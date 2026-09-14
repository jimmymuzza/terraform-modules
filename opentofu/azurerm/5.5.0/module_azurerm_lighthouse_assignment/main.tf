resource "azurerm_lighthouse_assignment" "lighthouse_assignments" {
  for_each = var.lighthouse_assignments

  lighthouse_definition_id = each.value.lighthouse_definition_id
  scope                    = each.value.scope
  name                     = each.value.name
}
