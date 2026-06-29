variable "redis_enterprise_databases" {
  description = <<EOT
Map of redis_enterprise_databases, attributes below
Required:
    - cluster_id
Optional:
    - client_protocol
    - clustering_policy
    - eviction_policy
    - linked_database_group_nickname
    - linked_database_id
    - name
    - port
    - module
EOT

  type = map(object({
    cluster_id                     = string
    client_protocol                = optional(string)
    clustering_policy              = optional(string)
    eviction_policy                = optional(string)
    linked_database_group_nickname = optional(string)
    linked_database_id             = optional(set(string))
    name                           = optional(string)
    port                           = optional(number)
    module                         = optional(list(object({
            name = string
            args = optional(string)
        })))
  }))
}
