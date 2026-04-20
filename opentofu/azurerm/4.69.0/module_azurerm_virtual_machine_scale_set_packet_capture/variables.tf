variable "virtual_machine_scale_set_packet_captures" {
  description = <<EOT
Map of virtual_machine_scale_set_packet_captures, attributes below
Required:
    - name
    - network_watcher_id
    - virtual_machine_scale_set_id
    - storage_location
Optional:
    - maximum_bytes_per_packet
    - maximum_bytes_per_session
    - maximum_capture_duration_in_seconds
    - filter
    - machine_scope
EOT

  type = map(object({
    name                                = string
    network_watcher_id                  = string
    virtual_machine_scale_set_id        = string
    maximum_bytes_per_packet            = optional(number)
    maximum_bytes_per_session           = optional(number)
    maximum_capture_duration_in_seconds = optional(number)
    filter                              = optional(list(object({
            protocol          = string
            local_ip_address  = optional(string)
            local_port        = optional(string)
            remote_ip_address = optional(string)
            remote_port       = optional(string)
        })))
    machine_scope                       = optional(list(object({
            exclude_instance_ids = optional(list(string))
            include_instance_ids = optional(list(string))
        })))
    storage_location                    = list(object({
            file_path          = optional(string)
            storage_account_id = optional(string)
        }))
  }))
}
