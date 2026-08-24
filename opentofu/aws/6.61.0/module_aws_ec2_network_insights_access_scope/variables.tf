variable "ec2_network_insights_access_scopes" {
  description = <<EOT
Map of ec2_network_insights_access_scopes, attributes below
Optional:
    - region
    - tags
    - exclude_paths
    - match_paths
EOT

  type = map(object({
    region        = optional(string)
    tags          = optional(map(string))
    exclude_paths = optional(list(object({
            destination       = optional(list(object({
                packet_header_statement = optional(list(object({
                    destination_addresses    = optional(list(string))
                    destination_ports        = optional(list(string))
                    destination_prefix_lists = optional(list(string))
                    protocols                = optional(list(string))
                    source_addresses         = optional(list(string))
                    source_ports             = optional(list(string))
                    source_prefix_lists      = optional(list(string))
                })))
                resource_statement      = optional(list(object({
                    resource_types = optional(list(string))
                    resources      = optional(list(string))
                })))
            })))
            source            = optional(list(object({
                packet_header_statement = optional(list(object({
                    destination_addresses    = optional(list(string))
                    destination_ports        = optional(list(string))
                    destination_prefix_lists = optional(list(string))
                    protocols                = optional(list(string))
                    source_addresses         = optional(list(string))
                    source_ports             = optional(list(string))
                    source_prefix_lists      = optional(list(string))
                })))
                resource_statement      = optional(list(object({
                    resource_types = optional(list(string))
                    resources      = optional(list(string))
                })))
            })))
            through_resources = optional(list(object({
                resource_statement = optional(list(object({
                    resource_types = optional(list(string))
                    resources      = optional(list(string))
                })))
            })))
        })))
    match_paths   = optional(list(object({
            destination = optional(list(object({
                packet_header_statement = optional(list(object({
                    destination_addresses    = optional(list(string))
                    destination_ports        = optional(list(string))
                    destination_prefix_lists = optional(list(string))
                    protocols                = optional(list(string))
                    source_addresses         = optional(list(string))
                    source_ports             = optional(list(string))
                    source_prefix_lists      = optional(list(string))
                })))
                resource_statement      = optional(list(object({
                    resource_types = optional(list(string))
                    resources      = optional(list(string))
                })))
            })))
            source      = optional(list(object({
                packet_header_statement = optional(list(object({
                    destination_addresses    = optional(list(string))
                    destination_ports        = optional(list(string))
                    destination_prefix_lists = optional(list(string))
                    protocols                = optional(list(string))
                    source_addresses         = optional(list(string))
                    source_ports             = optional(list(string))
                    source_prefix_lists      = optional(list(string))
                })))
                resource_statement      = optional(list(object({
                    resource_types = optional(list(string))
                    resources      = optional(list(string))
                })))
            })))
        })))
  }))
}
