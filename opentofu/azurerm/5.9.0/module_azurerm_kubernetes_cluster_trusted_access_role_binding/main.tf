resource "azurerm_kubernetes_cluster_trusted_access_role_binding" "kubernetes_cluster_trusted_access_role_bindings" {
  for_each = var.kubernetes_cluster_trusted_access_role_bindings

  kubernetes_cluster_id = each.value.kubernetes_cluster_id
  name                  = each.value.name
  roles                 = each.value.roles
  source_resource_id    = each.value.source_resource_id
}
