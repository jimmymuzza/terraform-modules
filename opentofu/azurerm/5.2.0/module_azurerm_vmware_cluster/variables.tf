variable "vmware_clusters" {
  description = <<EOT
Map of vmware_clusters, attributes below
Required:
    - cluster_node_count
    - name
    - sku_name
    - vmware_cloud_id
EOT

  type = map(object({
    cluster_node_count = number
    name               = string
    sku_name           = string
    vmware_cloud_id    = string
  }))
}
