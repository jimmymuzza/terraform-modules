variable "dx_macsec_key_associations" {
  description = <<EOT
Map of dx_macsec_key_associations, attributes below
Required:
    - connection_id
Optional:
    - cak
    - cak_wo
    - cak_wo_version
    - ckn
    - ckn_wo
    - ckn_wo_version
    - region
    - secret_arn
EOT

  type = map(object({
    connection_id  = string
    cak            = optional(string)
    cak_wo         = optional(string)
    cak_wo_version = optional(number)
    ckn            = optional(string)
    ckn_wo         = optional(string)
    ckn_wo_version = optional(number)
    region         = optional(string)
    secret_arn     = optional(string)
  }))
}
