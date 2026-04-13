variable "iam_saml_providers" {
  description = <<EOT
Map of iam_saml_providers, attributes below
Required:
    - name
    - saml_metadata_document
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    name                   = string
    saml_metadata_document = string
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
  }))
}
