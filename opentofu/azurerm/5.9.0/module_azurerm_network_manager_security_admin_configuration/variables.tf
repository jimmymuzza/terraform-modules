variable "network_manager_security_admin_configurations" {
  description = <<EOT
Map of network_manager_security_admin_configurations, attributes below
Required:
    - name
    - network_manager_id
Optional:
    - apply_on_network_intent_policy_based_services
    - description
EOT

  type = map(object({
    name                                          = string
    network_manager_id                            = string
    apply_on_network_intent_policy_based_services = optional(list(string))
    description                                   = optional(string)
  }))
}
