variable "servicecatalog_provisioning_artifacts" {
  description = <<EOT
Map of servicecatalog_provisioning_artifacts, attributes below
Required:
    - product_id
Optional:
    - accept_language
    - active
    - description
    - disable_template_validation
    - guidance
    - name
    - region
    - template_physical_id
    - template_url
    - type
EOT

  type = map(object({
    product_id                  = string
    accept_language             = optional(string)
    active                      = optional(bool)
    description                 = optional(string)
    disable_template_validation = optional(bool)
    guidance                    = optional(string)
    name                        = optional(string)
    region                      = optional(string)
    template_physical_id        = optional(string)
    template_url                = optional(string)
    type                        = optional(string)
  }))
}
