variable "servicebus_namespace_disaster_recovery_configs" {
  description = <<EOT
Map of servicebus_namespace_disaster_recovery_configs, attributes below
Required:
    - name
    - partner_namespace_id
    - primary_namespace_id
Optional:
    - alias_authorization_rule_id
EOT

  type = map(object({
    name                        = string
    partner_namespace_id        = string
    primary_namespace_id        = string
    alias_authorization_rule_id = optional(string)
  }))
}
