variable "redis_cache_access_policy_assignments" {
  description = <<EOT
Map of redis_cache_access_policy_assignments, attributes below
Required:
    - access_policy_name
    - name
    - object_id
    - object_id_alias
    - redis_cache_id
EOT

  type = map(object({
    access_policy_name = string
    name               = string
    object_id          = string
    object_id_alias    = string
    redis_cache_id     = string
  }))
}
