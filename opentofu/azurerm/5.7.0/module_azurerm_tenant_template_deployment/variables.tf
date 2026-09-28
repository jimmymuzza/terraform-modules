variable "tenant_template_deployments" {
  description = <<EOT
Map of tenant_template_deployments, attributes below
Required:
    - location
    - name
Optional:
    - debug_level
    - parameters_content
    - tags
    - template_content
    - template_spec_version_id
EOT

  type = map(object({
    location                 = string
    name                     = string
    debug_level              = optional(string)
    parameters_content       = optional(string)
    tags                     = optional(map(string))
    template_content         = optional(string)
    template_spec_version_id = optional(string)
  }))
}
