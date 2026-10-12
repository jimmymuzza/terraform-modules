resource "azurerm_kusto_database_principal_assignment" "kusto_database_principal_assignments" {
  for_each = var.kusto_database_principal_assignments

  cluster_name        = each.value.cluster_name
  database_name       = each.value.database_name
  name                = each.value.name
  principal_id        = each.value.principal_id
  principal_type      = each.value.principal_type
  resource_group_name = each.value.resource_group_name
  role                = each.value.role
  tenant_id           = each.value.tenant_id
}
