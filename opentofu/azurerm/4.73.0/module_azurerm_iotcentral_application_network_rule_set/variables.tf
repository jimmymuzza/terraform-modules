variable "iotcentral_application_network_rule_sets" {
  description = <<EOT
Map of iotcentral_application_network_rule_sets, attributes below
Required:
    - iotcentral_application_id
Optional:
    - apply_to_device
    - default_action
    - ip_rule
EOT

  type = map(object({
    iotcentral_application_id = string
    apply_to_device           = optional(bool)
    default_action            = optional(string)
    ip_rule                   = optional(list(object({
            ip_mask = string
            name    = string
        })))
  }))
}
