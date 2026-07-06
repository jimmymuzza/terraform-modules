variable "load_balancer_listener_policies" {
  description = <<EOT
Map of load_balancer_listener_policies, attributes below
Required:
    - load_balancer_name
    - load_balancer_port
Optional:
    - policy_names
    - region
    - triggers
EOT

  type = map(object({
    load_balancer_name = string
    load_balancer_port = number
    policy_names       = optional(set(string))
    region             = optional(string)
    triggers           = optional(map(string))
  }))
}
