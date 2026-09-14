variable "network_connection_monitors" {
  description = <<EOT
Map of network_connection_monitors, attributes below
Required:
    - location
    - name
    - network_watcher_id
    - endpoint
    - test_configuration
    - test_group
Optional:
    - notes
    - output_workspace_resource_ids
    - tags
EOT

  type = map(object({
    location                      = string
    name                          = string
    network_watcher_id            = string
    notes                         = optional(string)
    output_workspace_resource_ids = optional(set(string))
    tags                          = optional(map(string))
    endpoint                      = set(object({
            name                  = string
            address               = optional(string)
            coverage_level        = optional(string)
            excluded_ip_addresses = optional(set(string))
            included_ip_addresses = optional(set(string))
            target_resource_id    = optional(string)
            target_resource_type  = optional(string)
            filter                = optional(list(object({
                type = optional(string)
                item = optional(set(object({
                    address = optional(string)
                    type    = optional(string)
                })))
            })))
        }))
    test_configuration            = set(object({
            name                      = string
            protocol                  = string
            preferred_ip_version      = optional(string)
            test_frequency_in_seconds = optional(number)
            http_configuration        = optional(list(object({
                method                   = optional(string)
                path                     = optional(string)
                port                     = optional(number)
                prefer_https             = optional(bool)
                valid_status_code_ranges = optional(set(string))
                request_header           = optional(set(object({
                    name  = string
                    value = string
                })))
            })))
            icmp_configuration        = optional(list(object({
                trace_route_enabled = optional(bool)
            })))
            success_threshold         = optional(list(object({
                checks_failed_percent = optional(number)
                round_trip_time_ms    = optional(number)
            })))
            tcp_configuration         = optional(list(object({
                port                      = number
                destination_port_behavior = optional(string)
                trace_route_enabled       = optional(bool)
            })))
        }))
    test_group                    = set(object({
            destination_endpoints    = set(string)
            name                     = string
            source_endpoints         = set(string)
            test_configuration_names = set(string)
            enabled                  = optional(bool)
        }))
  }))
}
