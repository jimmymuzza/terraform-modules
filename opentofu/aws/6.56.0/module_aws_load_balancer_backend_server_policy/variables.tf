variable "load_balancer_backend_server_policies" {
  description = <<EOT
Map of load_balancer_backend_server_policies, attributes below
Required:
    - instance_port
    - load_balancer_name
Optional:
    - policy_names
    - region
EOT

  type = map(object({
    instance_port      = number
    load_balancer_name = string
    policy_names       = optional(set(string))
    region             = optional(string)
  }))
}
