variable "stream_analytics_output_tables" {
  description = <<EOT
Map of stream_analytics_output_tables, attributes below
Required:
    - batch_size
    - name
    - partition_key
    - resource_group_name
    - row_key
    - storage_account_key
    - storage_account_name
    - stream_analytics_job_name
    - table
Optional:
    - columns_to_remove
EOT

  type = map(object({
    batch_size                = number
    name                      = string
    partition_key             = string
    resource_group_name       = string
    row_key                   = string
    storage_account_key       = string
    storage_account_name      = string
    stream_analytics_job_name = string
    table                     = string
    columns_to_remove         = optional(list(string))
  }))
}
