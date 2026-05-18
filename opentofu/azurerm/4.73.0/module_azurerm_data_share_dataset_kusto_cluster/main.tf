resource "azurerm_data_share_dataset_kusto_cluster" "data_share_dataset_kusto_clusters" {
  for_each = var.data_share_dataset_kusto_clusters

  kusto_cluster_id = each.value.kusto_cluster_id
  name             = each.value.name
  share_id         = each.value.share_id
}
