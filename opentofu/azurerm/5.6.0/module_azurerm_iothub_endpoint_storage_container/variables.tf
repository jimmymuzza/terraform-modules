variable "iothub_endpoint_storage_containers" {
  description = <<EOT
Map of iothub_endpoint_storage_containers, attributes below
Required:
    - container_name
    - iothub_id
    - name
    - resource_group_name
Optional:
    - authentication_type
    - batch_frequency_in_seconds
    - connection_string
    - encoding
    - endpoint_uri
    - file_name_format
    - identity_id
    - max_chunk_size_in_bytes
    - subscription_id
EOT

  type = map(object({
    container_name             = string
    iothub_id                  = string
    name                       = string
    resource_group_name        = string
    authentication_type        = optional(string)
    batch_frequency_in_seconds = optional(number)
    connection_string          = optional(string)
    encoding                   = optional(string)
    endpoint_uri               = optional(string)
    file_name_format           = optional(string)
    identity_id                = optional(string)
    max_chunk_size_in_bytes    = optional(number)
    subscription_id            = optional(string)
  }))
}
