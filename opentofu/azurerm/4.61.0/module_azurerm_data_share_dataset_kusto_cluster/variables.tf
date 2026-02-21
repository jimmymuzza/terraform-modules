variable "data_share_dataset_kusto_clusters" {
  description = <<EOT
Map of data_share_dataset_kusto_clusters, attributes below
Required:
    - kusto_cluster_id
    - name
    - share_id
EOT

  type = map(object({
    kusto_cluster_id = string
    name             = string
    share_id         = string
  }))
}
