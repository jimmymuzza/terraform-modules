variable "data_share_dataset_kusto_databases" {
  description = <<EOT
Map of data_share_dataset_kusto_databases, attributes below
Required:
    - kusto_database_id
    - name
    - share_id
EOT

  type = map(object({
    kusto_database_id = string
    name              = string
    share_id          = string
  }))
}
