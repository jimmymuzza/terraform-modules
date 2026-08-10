variable "security_center_workspaces" {
  description = <<EOT
Map of security_center_workspaces, attributes below
Required:
    - scope
    - workspace_id
EOT

  type = map(object({
    scope        = string
    workspace_id = string
  }))
}
