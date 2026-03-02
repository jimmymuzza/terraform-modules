variable "network_packet_captures" {
  description = <<EOT
Map of network_packet_captures, attributes below
Required:
    - name
    - network_watcher_name
    - resource_group_name
    - target_resource_id
    - storage_location
Optional:
    - maximum_bytes_per_packet
    - maximum_bytes_per_session
    - maximum_capture_duration
    - filter
EOT

  type = map(object({
    name                      = string
    network_watcher_name      = string
    resource_group_name       = string
    target_resource_id        = string
    maximum_bytes_per_packet  = optional(number)
    maximum_bytes_per_session = optional(number)
    maximum_capture_duration  = optional(number)
    filter                    = optional(list(object({
            protocol          = string
            local_ip_address  = optional(string)
            local_port        = optional(string)
            remote_ip_address = optional(string)
            remote_port       = optional(string)
        })))
    storage_location          = list(object({
            file_path          = optional(string)
            storage_account_id = optional(string)
        }))
  }))
}
