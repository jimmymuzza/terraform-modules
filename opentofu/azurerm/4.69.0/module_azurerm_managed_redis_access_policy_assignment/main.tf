resource "azurerm_managed_redis_access_policy_assignment" "managed_redis_access_policy_assignments" {
  for_each = var.managed_redis_access_policy_assignments

  managed_redis_id = each.value.managed_redis_id
  object_id        = each.value.object_id
}
