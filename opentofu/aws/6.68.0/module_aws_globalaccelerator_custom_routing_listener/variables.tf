variable "globalaccelerator_custom_routing_listeners" {
  description = <<EOT
Map of globalaccelerator_custom_routing_listeners, attributes below
Required:
    - accelerator_arn
    - port_range
EOT

  type = map(object({
    accelerator_arn = string
    port_range      = set(object({
            from_port = optional(number)
            to_port   = optional(number)
        }))
  }))
}
