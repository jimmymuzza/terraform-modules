variable "kusto_eventhub_data_connections" {
  description = <<EOT
Map of kusto_eventhub_data_connections, attributes below
Required:
    - cluster_name
    - consumer_group
    - database_name
    - eventhub_id
    - location
    - name
    - resource_group_name
Optional:
    - compression
    - data_format
    - database_routing_type
    - event_system_properties
    - identity_id
    - mapping_rule_name
    - retrieval_start_date
    - table_name
EOT

  type = map(object({
    cluster_name            = string
    consumer_group          = string
    database_name           = string
    eventhub_id             = string
    location                = string
    name                    = string
    resource_group_name     = string
    compression             = optional(string)
    data_format             = optional(string)
    database_routing_type   = optional(string)
    event_system_properties = optional(list(string))
    identity_id             = optional(string)
    mapping_rule_name       = optional(string)
    retrieval_start_date    = optional(string)
    table_name              = optional(string)
  }))
}
