resource "azurerm_kusto_cluster_customer_managed_key" "kusto_cluster_customer_managed_keys" {
  for_each = var.kusto_cluster_customer_managed_keys

  cluster_id         = each.value.cluster_id
  key_name           = each.value.key_name
  key_vault_id       = each.value.key_vault_id
  key_version        = each.value.key_version
  managed_hsm_key_id = each.value.managed_hsm_key_id
  user_identity      = each.value.user_identity
}
