resource "azurerm_vmware_cluster" "vmware_clusters" {
  for_each = var.vmware_clusters

  cluster_node_count = each.value.cluster_node_count
  name               = each.value.name
  sku_name           = each.value.sku_name
  vmware_cloud_id    = each.value.vmware_cloud_id
}
