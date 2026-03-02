variable "globalaccelerator_custom_routing_endpoint_groups" {
  description = <<EOT
Map of globalaccelerator_custom_routing_endpoint_groups, attributes below
Required:
    - listener_arn
    - destination_configuration
Optional:
    - endpoint_group_region
    - endpoint_configuration
EOT

  type = map(object({
    listener_arn              = string
    endpoint_group_region     = optional(string)
    destination_configuration = set(object({
            from_port = number
            protocols = set(string)
            to_port   = number
        }))
    endpoint_configuration    = optional(set(object({
            endpoint_id = optional(string)
        })))
  }))
}
