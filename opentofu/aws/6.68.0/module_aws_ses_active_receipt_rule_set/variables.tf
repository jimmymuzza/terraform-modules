variable "ses_active_receipt_rule_sets" {
  description = <<EOT
Map of ses_active_receipt_rule_sets, attributes below
Required:
    - rule_set_name
Optional:
    - region
EOT

  type = map(object({
    rule_set_name = string
    region        = optional(string)
  }))
}
