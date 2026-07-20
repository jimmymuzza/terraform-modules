variable "invoicing_invoice_units" {
  description = <<EOT
Map of invoicing_invoice_units, attributes below
Required:
    - invoice_receiver
    - name
Optional:
    - description
    - region
    - tags
    - tax_inheritance_disabled
    - rule
EOT

  type = map(object({
    invoice_receiver         = string
    name                     = string
    description              = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    tax_inheritance_disabled = optional(bool)
    rule                     = optional(list(object({
            linked_accounts = set(string)
        })))
  }))
}
