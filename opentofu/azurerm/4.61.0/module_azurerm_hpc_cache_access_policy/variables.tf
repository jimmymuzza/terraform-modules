variable "hpc_cache_access_policies" {
  description = <<EOT
Map of hpc_cache_access_policies, attributes below
Required:
    - hpc_cache_id
    - name
    - access_rule
EOT

  type = map(object({
    hpc_cache_id = string
    name         = string
    access_rule  = set(object({
            access                  = string
            scope                   = string
            anonymous_gid           = optional(number)
            anonymous_uid           = optional(number)
            filter                  = optional(string)
            root_squash_enabled     = optional(bool)
            submount_access_enabled = optional(bool)
            suid_enabled            = optional(bool)
        }))
  }))
}
