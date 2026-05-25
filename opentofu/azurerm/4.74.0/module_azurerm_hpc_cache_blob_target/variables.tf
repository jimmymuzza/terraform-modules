variable "hpc_cache_blob_targets" {
  description = <<EOT
Map of hpc_cache_blob_targets, attributes below
Required:
    - cache_name
    - name
    - namespace_path
    - resource_group_name
    - storage_container_id
Optional:
    - access_policy_name
EOT

  type = map(object({
    cache_name           = string
    name                 = string
    namespace_path       = string
    resource_group_name  = string
    storage_container_id = string
    access_policy_name   = optional(string)
  }))
}
