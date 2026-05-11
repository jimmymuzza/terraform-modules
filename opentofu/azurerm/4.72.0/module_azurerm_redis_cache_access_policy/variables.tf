variable "redis_cache_access_policies" {
  description = <<EOT
Map of redis_cache_access_policies, attributes below
Required:
    - name
    - permissions
    - redis_cache_id
EOT

  type = map(object({
    name           = string
    permissions    = string
    redis_cache_id = string
  }))
}
