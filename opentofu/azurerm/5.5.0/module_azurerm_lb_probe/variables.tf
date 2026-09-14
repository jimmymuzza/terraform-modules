variable "lb_probes" {
  description = <<EOT
Map of lb_probes, attributes below
Required:
    - loadbalancer_id
    - name
    - port
Optional:
    - interval_in_seconds
    - no_healthy_backends_behavior
    - number_of_probes
    - probe_threshold
    - protocol
    - request_path
EOT

  type = map(object({
    loadbalancer_id              = string
    name                         = string
    port                         = number
    interval_in_seconds          = optional(number)
    no_healthy_backends_behavior = optional(string)
    number_of_probes             = optional(number)
    probe_threshold              = optional(number)
    protocol                     = optional(string)
    request_path                 = optional(string)
  }))
}
