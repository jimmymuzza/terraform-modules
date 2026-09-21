variable "redis_linked_servers" {
  description = <<EOT
Map of redis_linked_servers, attributes below
Required:
    - linked_redis_cache_id
    - linked_redis_cache_location
    - resource_group_name
    - server_role
    - target_redis_cache_name
EOT

  type = map(object({
    linked_redis_cache_id       = string
    linked_redis_cache_location = string
    resource_group_name         = string
    server_role                 = string
    target_redis_cache_name     = string
  }))
}
