resource "azurerm_hpc_cache_blob_target" "hpc_cache_blob_targets" {
  for_each = var.hpc_cache_blob_targets

  cache_name           = each.value.cache_name
  name                 = each.value.name
  namespace_path       = each.value.namespace_path
  resource_group_name  = each.value.resource_group_name
  storage_container_id = each.value.storage_container_id
  access_policy_name   = each.value.access_policy_name
}
