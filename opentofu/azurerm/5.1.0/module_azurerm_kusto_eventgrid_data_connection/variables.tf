variable "kusto_eventgrid_data_connections" {
  description = <<EOT
Map of kusto_eventgrid_data_connections, attributes below
Required:
    - cluster_name
    - database_name
    - eventhub_consumer_group_name
    - eventhub_id
    - location
    - name
    - resource_group_name
    - storage_account_id
Optional:
    - blob_storage_event_type
    - data_format
    - database_routing_type
    - eventgrid_event_subscription_id
    - managed_identity_id
    - mapping_rule_name
    - skip_first_record
    - table_name
EOT

  type = map(object({
    cluster_name                    = string
    database_name                   = string
    eventhub_consumer_group_name    = string
    eventhub_id                     = string
    location                        = string
    name                            = string
    resource_group_name             = string
    storage_account_id              = string
    blob_storage_event_type         = optional(string)
    data_format                     = optional(string)
    database_routing_type           = optional(string)
    eventgrid_event_subscription_id = optional(string)
    managed_identity_id             = optional(string)
    mapping_rule_name               = optional(string)
    skip_first_record               = optional(bool)
    table_name                      = optional(string)
  }))
}
