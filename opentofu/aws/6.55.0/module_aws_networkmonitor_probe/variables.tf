variable "networkmonitor_probes" {
  description = <<EOT
Map of networkmonitor_probes, attributes below
Required:
    - destination
    - monitor_name
    - protocol
    - source_arn
Optional:
    - destination_port
    - packet_size
    - region
    - tags
EOT

  type = map(object({
    destination      = string
    monitor_name     = string
    protocol         = string
    source_arn       = string
    destination_port = optional(number)
    packet_size      = optional(number)
    region           = optional(string)
    tags             = optional(map(string))
  }))
}
