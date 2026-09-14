variable "custom_directory_roles" {
  description = <<EOT
Map of custom_directory_roles, attributes below
Required:
    - display_name
    - enabled
    - version
    - permissions
Optional:
    - description
    - template_id
EOT

  type = map(object({
    display_name = string
    enabled      = bool
    version      = string
    description  = optional(string)
    template_id  = optional(string)
    permissions  = set(object({
            allowed_resource_actions = set(string)
        }))
  }))
}
