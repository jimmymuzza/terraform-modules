variable "api_management_workspaces" {
  description = <<EOT
Map of api_management_workspaces, attributes below
Required:
    - api_management_id
    - display_name
    - name
Optional:
    - description
EOT

  type = map(object({
    api_management_id = string
    display_name      = string
    name              = string
    description       = optional(string)
  }))
}
