variable "resource_group_template_deployments" {
  description = <<EOT
Map of resource_group_template_deployments, attributes below
Required:
    - deployment_mode
    - name
    - resource_group_name
Optional:
    - debug_level
    - parameters_content
    - tags
    - template_content
    - template_spec_version_id
EOT

  type = map(object({
    deployment_mode          = string
    name                     = string
    resource_group_name      = string
    debug_level              = optional(string)
    parameters_content       = optional(string)
    tags                     = optional(map(string))
    template_content         = optional(string)
    template_spec_version_id = optional(string)
  }))
}
