variable "workspaces_ip_groups" {
  description = <<EOT
Map of workspaces_ip_groups, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - rules
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    rules       = optional(set(object({
            source      = string
            description = optional(string)
        })))
  }))
}
