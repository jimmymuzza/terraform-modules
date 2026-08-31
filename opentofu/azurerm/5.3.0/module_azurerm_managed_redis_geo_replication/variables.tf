variable "managed_redis_geo_replications" {
  description = <<EOT
Map of managed_redis_geo_replications, attributes below
Required:
    - linked_managed_redis_ids
    - managed_redis_id
EOT

  type = map(object({
    linked_managed_redis_ids = set(string)
    managed_redis_id         = string
  }))
}
