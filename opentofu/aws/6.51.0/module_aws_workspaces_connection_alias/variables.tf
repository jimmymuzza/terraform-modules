variable "workspaces_connection_alias" {
  description = <<EOT
Map of workspaces_connection_alias, attributes below
Required:
    - connection_string
Optional:
    - region
    - tags
EOT

  type = map(object({
    connection_string = string
    region            = optional(string)
    tags              = optional(map(string))
  }))
}
