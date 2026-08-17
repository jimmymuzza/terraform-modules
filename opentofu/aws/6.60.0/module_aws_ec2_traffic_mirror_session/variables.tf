variable "ec2_traffic_mirror_sessions" {
  description = <<EOT
Map of ec2_traffic_mirror_sessions, attributes below
Required:
    - network_interface_id
    - session_number
    - traffic_mirror_filter_id
    - traffic_mirror_target_id
Optional:
    - description
    - packet_length
    - region
    - tags
    - tags_all
    - virtual_network_id
EOT

  type = map(object({
    network_interface_id     = string
    session_number           = number
    traffic_mirror_filter_id = string
    traffic_mirror_target_id = string
    description              = optional(string)
    packet_length            = optional(number)
    region                   = optional(string)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    virtual_network_id       = optional(number)
  }))
}
