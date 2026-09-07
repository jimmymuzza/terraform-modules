variable "iothub_file_uploads" {
  description = <<EOT
Map of iothub_file_uploads, attributes below
Required:
    - connection_string
    - container_name
    - iothub_id
Optional:
    - authentication_type
    - default_ttl
    - identity_id
    - lock_duration
    - max_delivery_count
    - notifications_enabled
    - sas_ttl
EOT

  type = map(object({
    connection_string     = string
    container_name        = string
    iothub_id             = string
    authentication_type   = optional(string)
    default_ttl           = optional(string)
    identity_id           = optional(string)
    lock_duration         = optional(string)
    max_delivery_count    = optional(number)
    notifications_enabled = optional(bool)
    sas_ttl               = optional(string)
  }))
}
