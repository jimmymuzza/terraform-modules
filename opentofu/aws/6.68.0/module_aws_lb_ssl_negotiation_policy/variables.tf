variable "lb_ssl_negotiation_policies" {
  description = <<EOT
Map of lb_ssl_negotiation_policies, attributes below
Required:
    - lb_port
    - load_balancer
    - name
Optional:
    - region
    - triggers
    - attribute
EOT

  type = map(object({
    lb_port       = number
    load_balancer = string
    name          = string
    region        = optional(string)
    triggers      = optional(map(string))
    attribute     = optional(set(object({
            name  = string
            value = string
        })))
  }))
}
