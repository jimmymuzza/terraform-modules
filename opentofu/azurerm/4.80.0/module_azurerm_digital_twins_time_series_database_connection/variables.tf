variable "digital_twins_time_series_database_connections" {
  description = <<EOT
Map of digital_twins_time_series_database_connections, attributes below
Required:
    - digital_twins_id
    - eventhub_name
    - eventhub_namespace_endpoint_uri
    - eventhub_namespace_id
    - kusto_cluster_id
    - kusto_cluster_uri
    - kusto_database_name
    - name
Optional:
    - eventhub_consumer_group_name
    - kusto_table_name
EOT

  type = map(object({
    digital_twins_id                = string
    eventhub_name                   = string
    eventhub_namespace_endpoint_uri = string
    eventhub_namespace_id           = string
    kusto_cluster_id                = string
    kusto_cluster_uri               = string
    kusto_database_name             = string
    name                            = string
    eventhub_consumer_group_name    = optional(string)
    kusto_table_name                = optional(string)
  }))
}
