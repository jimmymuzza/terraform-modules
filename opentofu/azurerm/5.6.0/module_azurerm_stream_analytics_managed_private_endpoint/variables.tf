variable "stream_analytics_managed_private_endpoints" {
  description = <<EOT
Map of stream_analytics_managed_private_endpoints, attributes below
Required:
    - name
    - resource_group_name
    - stream_analytics_cluster_name
    - subresource_name
    - target_resource_id
EOT

  type = map(object({
    name                          = string
    resource_group_name           = string
    stream_analytics_cluster_name = string
    subresource_name              = string
    target_resource_id            = string
  }))
}
