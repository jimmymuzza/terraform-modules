variable "ses_receipt_filters" {
  description = <<EOT
Map of ses_receipt_filters, attributes below
Required:
    - cidr
    - name
    - policy
Optional:
    - region
EOT

  type = map(object({
    cidr   = string
    name   = string
    policy = string
    region = optional(string)
  }))
}
