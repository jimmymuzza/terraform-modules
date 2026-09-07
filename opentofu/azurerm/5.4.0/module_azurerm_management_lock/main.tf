resource "azurerm_management_lock" "management_locks" {
  for_each = var.management_locks

  lock_level = each.value.lock_level
  name       = each.value.name
  scope      = each.value.scope
  notes      = each.value.notes
}
