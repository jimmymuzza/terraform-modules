variable "hpc_cache_blob_nfs_targets" {
  description = <<EOT
Map of hpc_cache_blob_nfs_targets, attributes below
Required:
    - cache_name
    - name
    - namespace_path
    - resource_group_name
    - storage_container_id
    - usage_model
Optional:
    - access_policy_name
    - verification_timer_in_seconds
    - write_back_timer_in_seconds
EOT

  type = map(object({
    cache_name                    = string
    name                          = string
    namespace_path                = string
    resource_group_name           = string
    storage_container_id          = string
    usage_model                   = string
    access_policy_name            = optional(string)
    verification_timer_in_seconds = optional(number)
    write_back_timer_in_seconds   = optional(number)
  }))
}
