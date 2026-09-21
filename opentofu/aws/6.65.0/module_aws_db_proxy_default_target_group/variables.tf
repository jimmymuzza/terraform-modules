variable "db_proxy_default_target_groups" {
  description = <<EOT
Map of db_proxy_default_target_groups, attributes below
Required:
    - db_proxy_name
Optional:
    - region
    - connection_pool_config
EOT

  type = map(object({
    db_proxy_name          = string
    region                 = optional(string)
    connection_pool_config = optional(list(object({
            connection_borrow_timeout    = optional(number)
            init_query                   = optional(string)
            max_connections_percent      = optional(number)
            max_idle_connections_percent = optional(number)
            session_pinning_filters      = optional(set(string))
        })))
  }))
}
