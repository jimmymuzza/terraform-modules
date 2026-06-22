variable "proxy_protocol_policies" {
  description = <<EOT
Map of proxy_protocol_policies, attributes below
Required:
    - instance_ports
    - load_balancer
Optional:
    - region
EOT

  type = map(object({
    instance_ports = set(string)
    load_balancer  = string
    region         = optional(string)
  }))
}
