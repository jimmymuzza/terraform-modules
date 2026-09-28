variable "load_balancer_policies" {
  description = <<EOT
Map of load_balancer_policies, attributes below
Required:
    - load_balancer_name
    - policy_name
    - policy_type_name
Optional:
    - region
    - policy_attribute
EOT

  type = map(object({
    load_balancer_name = string
    policy_name        = string
    policy_type_name   = string
    region             = optional(string)
    policy_attribute   = optional(set(object({
            name  = optional(string)
            value = optional(string)
        })))
  }))
}
