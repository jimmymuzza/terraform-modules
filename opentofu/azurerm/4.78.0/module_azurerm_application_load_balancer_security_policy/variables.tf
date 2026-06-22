variable "application_load_balancer_security_policies" {
  description = <<EOT
Map of application_load_balancer_security_policies, attributes below
Required:
    - application_load_balancer_id
    - location
    - name
    - web_application_firewall_policy_id
Optional:
    - tags
EOT

  type = map(object({
    application_load_balancer_id       = string
    location                           = string
    name                               = string
    web_application_firewall_policy_id = string
    tags                               = optional(map(string))
  }))
}
