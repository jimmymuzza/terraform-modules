variable "paymentcryptography_key_alias" {
  description = <<EOT
Map of paymentcryptography_key_alias, attributes below
Required:
    - alias_name
Optional:
    - key_arn
    - region
EOT

  type = map(object({
    alias_name = string
    key_arn    = optional(string)
    region     = optional(string)
  }))
}
