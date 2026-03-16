variable "sesv2_account_suppression_attributes" {
  description = <<EOT
Map of sesv2_account_suppression_attributes, attributes below
Required:
    - suppressed_reasons
Optional:
    - region
EOT

  type = map(object({
    suppressed_reasons = set(string)
    region             = optional(string)
  }))
}
