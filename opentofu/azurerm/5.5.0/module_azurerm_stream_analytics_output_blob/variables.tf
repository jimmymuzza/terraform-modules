variable "stream_analytics_output_blobs" {
  description = <<EOT
Map of stream_analytics_output_blobs, attributes below
Required:
    - date_format
    - name
    - path_pattern
    - resource_group_name
    - storage_account_name
    - storage_container_name
    - stream_analytics_job_name
    - time_format
    - serialization
Optional:
    - authentication_mode
    - batch_max_wait_time
    - batch_min_rows
    - blob_write_mode
    - storage_account_key
EOT

  type = map(object({
    date_format               = string
    name                      = string
    path_pattern              = string
    resource_group_name       = string
    storage_account_name      = string
    storage_container_name    = string
    stream_analytics_job_name = string
    time_format               = string
    authentication_mode       = optional(string)
    batch_max_wait_time       = optional(string)
    batch_min_rows            = optional(number)
    blob_write_mode           = optional(string)
    storage_account_key       = optional(string)
    serialization             = list(object({
            type            = string
            encoding        = optional(string)
            field_delimiter = optional(string)
            format          = optional(string)
        }))
  }))
}
