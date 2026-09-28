variable "confidential_ledgers" {
  description = <<EOT
Map of confidential_ledgers, attributes below
Required:
    - ledger_type
    - location
    - name
    - resource_group_name
    - azuread_based_service_principal
Optional:
    - tags
    - certificate_based_security_principal
EOT

  type = map(object({
    ledger_type                          = string
    location                             = string
    name                                 = string
    resource_group_name                  = string
    tags                                 = optional(map(string))
    azuread_based_service_principal      = list(object({
            ledger_role_name = string
            principal_id     = string
            tenant_id        = string
        }))
    certificate_based_security_principal = optional(list(object({
            ledger_role_name = string
            pem_public_key   = string
        })))
  }))
}
