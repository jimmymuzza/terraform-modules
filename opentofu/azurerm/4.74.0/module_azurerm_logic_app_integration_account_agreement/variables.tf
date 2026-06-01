variable "logic_app_integration_account_agreements" {
  description = <<EOT
Map of logic_app_integration_account_agreements, attributes below
Required:
    - agreement_type
    - content
    - guest_partner_name
    - host_partner_name
    - integration_account_name
    - name
    - resource_group_name
    - guest_identity
    - host_identity
Optional:
    - metadata
EOT

  type = map(object({
    agreement_type           = string
    content                  = string
    guest_partner_name       = string
    host_partner_name        = string
    integration_account_name = string
    name                     = string
    resource_group_name      = string
    metadata                 = optional(map(string))
    guest_identity           = list(object({
            qualifier = string
            value     = string
        }))
    host_identity            = list(object({
            qualifier = string
            value     = string
        }))
  }))
}
