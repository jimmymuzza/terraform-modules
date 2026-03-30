resource "azurerm_hpc_cache_nfs_target" "hpc_cache_nfs_targets" {
  for_each = var.hpc_cache_nfs_targets

  cache_name                    = each.value.cache_name
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  target_host_name              = each.value.target_host_name
  usage_model                   = each.value.usage_model
  verification_timer_in_seconds = each.value.verification_timer_in_seconds
  write_back_timer_in_seconds   = each.value.write_back_timer_in_seconds

  dynamic "namespace_junction" {
    for_each = each.value.namespace_junction != null ? each.value.namespace_junction : []
    content {
      namespace_path     = namespace_junction.value.namespace_path
      nfs_export         = namespace_junction.value.nfs_export
      access_policy_name = namespace_junction.value.access_policy_name
      target_path        = namespace_junction.value.target_path
    }
  }
}
