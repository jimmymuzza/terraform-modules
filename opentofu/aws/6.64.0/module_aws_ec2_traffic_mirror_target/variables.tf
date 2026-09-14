variable "ec2_traffic_mirror_targets" {
  description = <<EOT
Map of ec2_traffic_mirror_targets, attributes below
Optional:
    - description
    - gateway_load_balancer_endpoint_id
    - network_interface_id
    - network_load_balancer_arn
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    description                       = optional(string)
    gateway_load_balancer_endpoint_id = optional(string)
    network_interface_id              = optional(string)
    network_load_balancer_arn         = optional(string)
    region                            = optional(string)
    tags                              = optional(map(string))
    tags_all                          = optional(map(string))
  }))
}
