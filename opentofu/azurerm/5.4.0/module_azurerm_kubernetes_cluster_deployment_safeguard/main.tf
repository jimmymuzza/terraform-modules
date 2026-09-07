resource "azurerm_kubernetes_cluster_deployment_safeguard" "kubernetes_cluster_deployment_safeguards" {
  for_each = var.kubernetes_cluster_deployment_safeguards

  kubernetes_cluster_id        = each.value.kubernetes_cluster_id
  level                        = each.value.level
  excluded_namespaces          = each.value.excluded_namespaces
  pod_security_standards_level = each.value.pod_security_standards_level
}
