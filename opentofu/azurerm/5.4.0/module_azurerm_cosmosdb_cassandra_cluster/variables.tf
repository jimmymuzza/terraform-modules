variable "cosmosdb_cassandra_clusters" {
  description = <<EOT
Map of cosmosdb_cassandra_clusters, attributes below
Required:
    - default_admin_password
    - delegated_management_subnet_id
    - location
    - name
    - resource_group_name
Optional:
    - authentication_method
    - client_certificate_pems
    - external_gossip_certificate_pems
    - external_seed_node_ip_addresses
    - hours_between_backups
    - repair_enabled
    - tags
    - version
    - identity
EOT

  type = map(object({
    default_admin_password           = string
    delegated_management_subnet_id   = string
    location                         = string
    name                             = string
    resource_group_name              = string
    authentication_method            = optional(string)
    client_certificate_pems          = optional(list(string))
    external_gossip_certificate_pems = optional(list(string))
    external_seed_node_ip_addresses  = optional(list(string))
    hours_between_backups            = optional(number)
    repair_enabled                   = optional(bool)
    tags                             = optional(map(string))
    version                          = optional(string)
    identity                         = optional(list(object({
            type = string
        })))
  }))
}
