variable "opensearch_outbound_connections" {
  description = <<EOT
Map of opensearch_outbound_connections, attributes below
Required:
    - connection_alias
    - local_domain_info
    - remote_domain_info
Optional:
    - accept_connection
    - connection_mode
    - region
    - connection_properties
EOT

  type = map(object({
    connection_alias      = string
    accept_connection     = optional(bool)
    connection_mode       = optional(string)
    region                = optional(string)
    connection_properties = optional(list(object({
            cross_cluster_search = optional(list(object({
                skip_unavailable = optional(string)
            })))
        })))
    local_domain_info     = list(object({
            domain_name = string
            owner_id    = string
            region      = string
        }))
    remote_domain_info    = list(object({
            domain_name = string
            owner_id    = string
            region      = string
        }))
  }))
}
