variable "managed_redis_access_policy_assignments" {
  description = <<EOT
Map of managed_redis_access_policy_assignments, attributes below
Required:
    - managed_redis_id
    - object_id
EOT

  type = map(object({
    managed_redis_id = string
    object_id        = string
  }))
}
