variable "lightsail_instance_public_ports" {
  description = <<EOT
Map of lightsail_instance_public_ports, attributes below
Required:
    - instance_name
    - port_info
Optional:
    - region
EOT

  type = map(object({
    instance_name = string
    region        = optional(string)
    port_info     = set(object({
            from_port         = number
            protocol          = string
            to_port           = number
            cidr_list_aliases = optional(set(string))
            cidrs             = optional(set(string))
            ipv6_cidrs        = optional(set(string))
        }))
  }))
}
