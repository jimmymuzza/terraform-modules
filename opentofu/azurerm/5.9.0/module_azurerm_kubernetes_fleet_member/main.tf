resource "azurerm_kubernetes_fleet_member" "kubernetes_fleet_members" {
  for_each = var.kubernetes_fleet_members

  kubernetes_cluster_id = each.value.kubernetes_cluster_id
  kubernetes_fleet_id   = each.value.kubernetes_fleet_id
  name                  = each.value.name
  group                 = each.value.group
}
