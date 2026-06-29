variable "kms_ciphertexts" {
  description = <<EOT
Map of kms_ciphertexts, attributes below
Required:
    - key_id
Optional:
    - context
    - plaintext
    - plaintext_wo
    - plaintext_wo_version
    - region
EOT

  type = map(object({
    key_id               = string
    context              = optional(map(string))
    plaintext            = optional(string)
    plaintext_wo         = optional(string)
    plaintext_wo_version = optional(string)
    region               = optional(string)
  }))
}
