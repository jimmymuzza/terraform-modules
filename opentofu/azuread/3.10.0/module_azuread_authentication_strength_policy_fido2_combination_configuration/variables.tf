variable "authentication_strength_policy_fido2_combination_configurations" {
  description = <<EOT
Map of authentication_strength_policy_fido2_combination_configurations, attributes below
Required:
    - allowed_aaguids
    - authentication_strength_policy_id
EOT

  type = map(object({
    allowed_aaguids                   = set(string)
    authentication_strength_policy_id = string
  }))
}
