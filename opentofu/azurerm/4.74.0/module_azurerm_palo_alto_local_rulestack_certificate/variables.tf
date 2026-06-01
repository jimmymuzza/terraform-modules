variable "palo_alto_local_rulestack_certificates" {
  description = <<EOT
Map of palo_alto_local_rulestack_certificates, attributes below
Required:
    - name
    - rulestack_id
Optional:
    - audit_comment
    - description
    - key_vault_certificate_id
    - self_signed
EOT

  type = map(object({
    name                     = string
    rulestack_id             = string
    audit_comment            = optional(string)
    description              = optional(string)
    key_vault_certificate_id = optional(string)
    self_signed              = optional(bool)
  }))
}
