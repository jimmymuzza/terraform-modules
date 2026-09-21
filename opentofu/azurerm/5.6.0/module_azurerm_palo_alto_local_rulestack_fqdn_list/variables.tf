variable "palo_alto_local_rulestack_fqdn_lists" {
  description = <<EOT
Map of palo_alto_local_rulestack_fqdn_lists, attributes below
Required:
    - fully_qualified_domain_names
    - name
    - rulestack_id
Optional:
    - audit_comment
    - description
EOT

  type = map(object({
    fully_qualified_domain_names = list(string)
    name                         = string
    rulestack_id                 = string
    audit_comment                = optional(string)
    description                  = optional(string)
  }))
}
