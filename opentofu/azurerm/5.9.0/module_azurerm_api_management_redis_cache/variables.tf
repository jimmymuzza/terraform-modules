variable "api_management_redis_caches" {
  description = <<EOT
Map of api_management_redis_caches, attributes below
Required:
    - api_management_id
    - connection_string
    - name
Optional:
    - cache_location
    - description
    - redis_cache_id
EOT

  type = map(object({
    api_management_id = string
    connection_string = string
    name              = string
    cache_location    = optional(string)
    description       = optional(string)
    redis_cache_id    = optional(string)
  }))
}
