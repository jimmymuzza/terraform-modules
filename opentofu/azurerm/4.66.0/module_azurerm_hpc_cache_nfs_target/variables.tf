variable "hpc_cache_nfs_targets" {
  description = <<EOT
Map of hpc_cache_nfs_targets, attributes below
Required:
    - cache_name
    - name
    - resource_group_name
    - target_host_name
    - usage_model
    - namespace_junction
Optional:
    - verification_timer_in_seconds
    - write_back_timer_in_seconds
EOT

  type = map(object({
    cache_name                    = string
    name                          = string
    resource_group_name           = string
    target_host_name              = string
    usage_model                   = string
    verification_timer_in_seconds = optional(number)
    write_back_timer_in_seconds   = optional(number)
    namespace_junction            = set(object({
            namespace_path     = string
            nfs_export         = string
            access_policy_name = optional(string)
            target_path        = optional(string)
        }))
  }))
}
