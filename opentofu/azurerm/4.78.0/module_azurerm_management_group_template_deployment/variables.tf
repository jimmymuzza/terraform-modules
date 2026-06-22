variable "management_group_template_deployments" {
  description = <<EOT
Map of management_group_template_deployments, attributes below
Required:
    - location
    - management_group_id
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
    management_group_id      = string
    name                     = string
    debug_level              = optional(string)
    parameters_content       = optional(string)
    tags                     = optional(map(string))
    template_content         = optional(string)
    template_spec_version_id = optional(string)
  }))
}
