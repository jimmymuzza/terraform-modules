variable "virtual_desktop_workspace_application_group_associations" {
  description = <<EOT
Map of virtual_desktop_workspace_application_group_associations, attributes below
Required:
    - application_group_id
    - workspace_id
EOT

  type = map(object({
    application_group_id = string
    workspace_id         = string
  }))
}
