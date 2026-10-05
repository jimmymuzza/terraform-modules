variable "dx_macsec_key_associations" {
  description = <<EOT
Map of dx_macsec_key_associations, attributes below
Required:
    - connection_id
Optional:
    - cak
    - ckn
    - region
    - secret_arn
EOT

  type = map(object({
    connection_id = string
    cak           = optional(string)
    ckn           = optional(string)
    region        = optional(string)
    secret_arn    = optional(string)
  }))
}
