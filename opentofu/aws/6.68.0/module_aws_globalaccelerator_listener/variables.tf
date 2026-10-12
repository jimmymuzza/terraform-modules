variable "globalaccelerator_listeners" {
  description = <<EOT
Map of globalaccelerator_listeners, attributes below
Required:
    - accelerator_arn
    - protocol
    - port_range
Optional:
    - client_affinity
EOT

  type = map(object({
    accelerator_arn = string
    protocol        = string
    client_affinity = optional(string)
    port_range      = set(object({
            from_port = optional(number)
            to_port   = optional(number)
        }))
  }))
}
