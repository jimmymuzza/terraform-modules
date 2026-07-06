variable "kusto_cluster_managed_private_endpoints" {
  description = <<EOT
Map of kusto_cluster_managed_private_endpoints, attributes below
Required:
    - cluster_name
    - group_id
    - name
    - private_link_resource_id
    - resource_group_name
Optional:
    - private_link_resource_region
    - request_message
EOT

  type = map(object({
    cluster_name                 = string
    group_id                     = string
    name                         = string
    private_link_resource_id     = string
    resource_group_name          = string
    private_link_resource_region = optional(string)
    request_message              = optional(string)
  }))
}
