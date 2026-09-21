variable "ec2_network_insights_paths" {
  description = <<EOT
Map of ec2_network_insights_paths, attributes below
Required:
    - protocol
    - source
Optional:
    - destination
    - destination_ip
    - destination_port
    - region
    - source_ip
    - tags
    - tags_all
    - filter_at_destination
    - filter_at_source
EOT

  type = map(object({
    protocol              = string
    source                = string
    destination           = optional(string)
    destination_ip        = optional(string)
    destination_port      = optional(number)
    region                = optional(string)
    source_ip             = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    filter_at_destination = optional(list(object({
            destination_address    = optional(string)
            source_address         = optional(string)
            destination_port_range = optional(list(object({
                from_port = optional(number)
                to_port   = optional(number)
            })))
            source_port_range      = optional(list(object({
                from_port = optional(number)
                to_port   = optional(number)
            })))
        })))
    filter_at_source      = optional(list(object({
            destination_address    = optional(string)
            source_address         = optional(string)
            destination_port_range = optional(list(object({
                from_port = optional(number)
                to_port   = optional(number)
            })))
            source_port_range      = optional(list(object({
                from_port = optional(number)
                to_port   = optional(number)
            })))
        })))
  }))
}
