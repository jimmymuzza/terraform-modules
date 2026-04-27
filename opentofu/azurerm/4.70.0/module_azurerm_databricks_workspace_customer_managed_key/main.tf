resource "azurerm_databricks_workspace_customer_managed_key" "databricks_workspace_customer_managed_keys" {
  for_each = var.databricks_workspace_customer_managed_keys

  key_vault_key_id = each.value.key_vault_key_id
  workspace_id     = each.value.workspace_id
}
