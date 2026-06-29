variable "service_principal_delegated_permission_grants" {
  description = <<EOT
Map of service_principal_delegated_permission_grants, attributes below
Required:
    - claim_values
    - resource_service_principal_object_id
    - service_principal_object_id
Optional:
    - user_object_id
EOT

  type = map(object({
    claim_values                         = set(string)
    resource_service_principal_object_id = string
    service_principal_object_id          = string
    user_object_id                       = optional(string)
  }))
}
