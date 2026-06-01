resource "azurerm_log_analytics_cluster_customer_managed_key" "log_analytics_cluster_customer_managed_keys" {
  for_each = var.log_analytics_cluster_customer_managed_keys

  key_vault_key_id         = each.value.key_vault_key_id
  log_analytics_cluster_id = each.value.log_analytics_cluster_id
}
