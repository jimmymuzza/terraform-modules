variable "authentication_strength_policy_x509_combination_configurations" {
  description = <<EOT
Map of authentication_strength_policy_x509_combination_configurations, attributes below
Required:
    - applies_to_combinations
    - authentication_strength_policy_id
Optional:
    - allowed_issuer_skis
    - allowed_policy_oids
EOT

  type = map(object({
    applies_to_combinations           = set(string)
    authentication_strength_policy_id = string
    allowed_issuer_skis               = optional(set(string))
    allowed_policy_oids               = optional(set(string))
  }))
}
