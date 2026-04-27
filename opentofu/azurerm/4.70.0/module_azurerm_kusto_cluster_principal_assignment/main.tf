resource "azurerm_kusto_cluster_principal_assignment" "kusto_cluster_principal_assignments" {
  for_each = var.kusto_cluster_principal_assignments

  cluster_name        = each.value.cluster_name
  name                = each.value.name
  principal_id        = each.value.principal_id
  principal_type      = each.value.principal_type
  resource_group_name = each.value.resource_group_name
  role                = each.value.role
  tenant_id           = each.value.tenant_id
}
