variable "service_principal_claims_mapping_policy_assignments" {
  description = <<EOT
Map of service_principal_claims_mapping_policy_assignments, attributes below
Required:
    - claims_mapping_policy_id
    - service_principal_id
EOT

  type = map(object({
    claims_mapping_policy_id = string
    service_principal_id     = string
  }))
}
