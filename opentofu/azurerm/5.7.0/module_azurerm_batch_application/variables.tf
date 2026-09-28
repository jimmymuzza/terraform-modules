variable "batch_applications" {
  description = <<EOT
Map of batch_applications, attributes below
Required:
    - account_name
    - name
    - resource_group_name
Optional:
    - allow_updates
    - default_version
    - display_name
EOT

  type = map(object({
    account_name        = string
    name                = string
    resource_group_name = string
    allow_updates       = optional(bool)
    default_version     = optional(string)
    display_name        = optional(string)
  }))
}
